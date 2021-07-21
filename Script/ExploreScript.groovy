//tag::dependencias[]

import groovy.json.JsonSlurper
@Grapes([
        @Grab('org.grails:grails-datastore-gorm-hibernate5:6.1.0.RELEASE'),
        @Grab(group = 'org.slf4j', module = 'slf4j-simple', version = '1.7.31', scope = 'test'),
        @Grab('mysql:mysql-connector-java:8.0.22'),
        @Grab("org.apache.tomcat:tomcat-jdbc:8.5.0"),
        @Grab("org.apache.tomcat.embed:tomcat-embed-logging-log4j:8.5.0"),
        @Grab("org.slf4j:slf4j-api:1.7.10"),
        @Grab('org.xerial:sqlite-jdbc:3.21.0'),
        @Grab('com.enigmabridge:hibernate4-sqlite-dialect:0.1.2'),
        @Grab(group='com.github.groovy-wslite', module='groovy-wslite', version='0.7.1')
])

import groovy.sql.Sql
import groovy.transform.EqualsAndHashCode
import groovy.transform.Field
import groovy.transform.ToString
import org.codehaus.groovy.util.HashCodeHelper
import org.grails.orm.hibernate.HibernateDatastore
import grails.gorm.annotation.Entity
import java.nio.charset.StandardCharsets
import java.text.SimpleDateFormat
import groovy.json.JsonSlurper
import wslite.rest.*
import java.nio.charset.*
import grails.gorm.transactions.Transactional
//end::dependencias[]

//tag::domain[]
@Entity
@ToString
class Course {

    String title
    //String description
    String url
    String category
    Float duration
    Long idCurso
    String language
    String author
    Integer popularity
    Float rating
    String difficulty
    /*
    isFree can be:
    - 0 if the course is NOT free
    - 1 if the course is free
    - 2 if the course is from Coursera (The course is free but you must pay for the certificate)
    - 3 if the course is from Udacity (You must pay a monthly subscription fee of 359€)
     */
    int isFree
    Float price
    String originalPage

    static mapping = {
        //description type: 'text'
    }

    static constraints = {
        title nullable: false
        //description nullable: true
        rating nullable: true
        url nullable: true
        category nullable: false
        duration nullable: true
        idCurso nullable: true
        language nullable: true
        author nullable: true
        popularity nullable: true
        difficulty nullable: true
        price nullable: true
        originalPage nullable: true

    }
}

@Entity
@ToString
class CourseList {

    String name
    String description
    static belongsTo = [owner: User]
    static hasMany = [courses: Course]

    static constraints = {
        name nullable: false
        description nullable: true
        owner nullable: false
    }
}

@Entity
@ToString
@EqualsAndHashCode(includes='name')
class Skill {
    String name
    String level
    static constraints = {
        name nullable: false
        level matches: /basic||medium||expert/
    }
}

@Entity
@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

    private static final long serialVersionUID = 1

    String authority

    static constraints = {
        authority nullable: false, blank: false, unique: true
    }

    static mapping = {
    }
}

@Entity
@ToString(includeNames=true, includePackage=false)
class UserRole implements Serializable {

    private static final long serialVersionUID = 1

    User user
    Role role

    @Override
    boolean equals(other) {
        if (other instanceof UserRole) {
            other.userId == user?.id && other.roleId == role?.id
        }
    }

    @Override
    int hashCode() {
        int hashCode = HashCodeHelper.initHash()
        if (user) {
            hashCode = HashCodeHelper.updateHash(hashCode, user.id)
        }
        if (role) {
            hashCode = HashCodeHelper.updateHash(hashCode, role.id)
        }
        hashCode
    }

    static UserRole get(long userId, long roleId) {
        criteriaFor(userId, roleId).get()
    }

    static boolean exists(long userId, long roleId) {
        criteriaFor(userId, roleId).count()
    }

    /*
    private static DetachedCriteria criteriaFor(long userId, long roleId) {
        UserRole.where {
            user == User.load(userId) &&
                    role == Role.load(roleId)
        }
    }
*/

    static UserRole create(User user, Role role, boolean flush = false) {
        def instance = new UserRole(user: user, role: role)
        instance.save(flush: flush)
        instance
    }

    static boolean remove(User u, Role r) {
        if (u != null && r != null) {
            UserRole.where { user == u && role == r }.deleteAll()
        }
    }

    static int removeAll(User u) {
        u == null ? 0 : UserRole.where { user == u }.deleteAll() as int
    }

    static int removeAll(Role r) {
        r == null ? 0 : UserRole.where { role == r }.deleteAll() as int
    }

    static constraints = {
        user nullable: false
        role nullable: false, validator: { Role r, UserRole ur ->
            if (ur.user?.id) {
                if (UserRole.exists(ur.user.id, r.id)) {
                    return ['userRole.exists']
                }
            }
        }
    }

    static mapping = {
        id composite: ['user', 'role']
        version false
    }
}

@Entity
@ToString
class UserFeedback {

    static belongsTo = [user : User]
    long clicksSearch
    long clicksRecommend
    long clicksRelatedToQuery
    long clicksRelatedToCourse
    long addToListSearch
    long addToListRecommend
    long addToListRelatedToQuery
    long addToListRelatedToCourse
    long notInterestedCoursera
    long notInterestedUdemy
    long notInterestedUdacity

    static constraints = {
    }
}

@Entity
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String email
    String phoneNumber
    Integer age
    String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date())
    // Variable used to determine if other users are allowed to view this user's profile, by default its value is false
    boolean isPublicProfile
    boolean hasProfileImage
    byte[] profileImageBytes
    String profileImageContentType
    static hasOne = [feedback:UserFeedback]
    static hasMany = [lists: CourseList,
                      basicSkills: Skill,
                      mediumSkills: Skill,
                      expertSkills: Skill]
    List<String> interests
    List<String> recentSearches
    Set<Long> bannedCourses
    List<Long> exploreRecommendationsIds
    List<String> languages
    //User preferences
    Float duration
    Float cost
    Float popularity
    Float difficulty
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        phoneNumber nullable: true, matches: /\d{9}/
        email matches: /.*@.*/
        age nullable: true
        profileImageBytes nullable: true
        profileImageContentType nullable: true
        basicSkills nullable: true
        mediumSkills nullable: true
        expertSkills nullable: true
        duration nullable: true
        cost nullable: true
        popularity nullable: true
        difficulty nullable: true
        feedback nullable: true
    }

    static mapping = {
        //password column: '`password`'
        profileImageBytes column: 'featured_image_bytes', sqlType: 'longblob'
        basicSkills joinTable: [name:"basic_skills"]
        mediumSkills joinTable: [name:"medium_skills"]
        expertSkills joinTable: [name:"expert_skills"]
    }

    /**
     * Method use to create a string with all user's basic level skills and returns it
     * @return String with the basic level skills
     */
    String basicSkillsToString(){
        if (!basicSkills.isEmpty()){
            String out=basicSkills[0].name
            for (int i=1;i<basicSkills.size();i++){
                out=out+","+basicSkills[i].name
            }
            out
        }else{
            ""
        }
    }

    /**
     * Method use to create a string with all user's medium level skills and returns it
     * @return String with the medium level skills
     */
    String mediumSkillsToString(){
        if (!mediumSkills.isEmpty()){
            String out=mediumSkills[0].name
            for (int i=1;i<mediumSkills.size();i++){
                out=out+","+mediumSkills[i].name
            }
            out
        }else{
            ""
        }
    }

    /**
     * Method use to create a string with all user's expert level skills and returns it
     * @return String with the expert level skills
     */
    String expertSkillsToString(){
        if (!expertSkills.isEmpty()){
            String out=expertSkills[0].name
            for (int i=1;i<expertSkills.size();i++){
                out=out+","+expertSkills[i].name
            }
            out
        }else{
            ""
        }
    }
}

//end::domain[]

//tag::config[]
Map getConfiguration() {
    [
            'dataSource.url'        : 'jdbc:mysql://mysql:3306/test',
            'dataSource.drive'      : 'org.sqlite.JDBC',
            'dataSource.username'   : 'root',
            'dataSource.password'   : 'pass',
            'hibernate.hbm2ddl.auto': 'update',
            'hibernate.dialect'     : 'com.enigmabridge.hibernate.dialect.SQLiteDialect'
    ]
}

HibernateDatastore initDatastore() {
    new HibernateDatastore(configuration, Course, CourseList,Role,UserRole,Skill,User,UserFeedback)
}
//end::config[]

//tag::RecommenderService[]
@Field def LANGUAGES = [
        "English",
        "Spanish",
        "German",
        "Portuguese",
        "Romanian",
        "Arabic",
        "Italian",
        "Hungarian",
        "French",
        "Persian",
        "Turkish",
        "Indonesian",
        "Simplified Chinese",
        "Japanese",
        "Polish",
        "Hindi",
        "Russian",
        "Vietnamese",
        "Thai",
        "Dutch",
        "Kazakh",
        "Traditional Chinese",
        "Hebrew",
        "Urdu",
        "Bengali",
        "Tamil",
        "Telugu",
        "Norwegian",
        "Korean",
        "Czech",
        "Greek",
        "Burmese",
        "Serbian",
        "Finnish",
        "Filipino",
        "Pashto",
        "Malayalam",
        "Croatian",
        "Kannada",
        "Danish",
        "Marathi",
        "Azeri",
        "Georgian",
        "Afrikaans",
        "Bulgarian",
        "Ukrainian",
        "Slovenian",
        "Punjabi",
        "Mongolian",
        "Swahili",
        "Catalan",
        "Albanian",
        "Slovak",
        "Somali",
        "Irish",
        "Estonian",
        "Uzbek",
        "Gujarati",
        "Lithuanian",
        "Latvian",
        "Armenian",
        "Swedish",
        "Kurdish",
        "Aymara",
        "Khmer",
        "Malay",
        "Nepali",
        "Tatar"
]
@Field float DEFAULT_RATING = 4.5
@Field float DEFAULT_DURATION = 18.050667
@Field float DEFAULT_POPULARITY = 383077.8
@Field float DEFAULT_COST = 57.3941
@Field String DEFAULT_DIFFICULTY = "beginner"
@Field int DEFAULT_ISFREE = 1
@Field String DEFAULT_INSTITUTION = "Coursera"

/**
 * Method that returns the list of courses whose id belongs to the list of ids received in the API request.
 * @param idsUdacity
 * @param idsCoursera
 * @param idsUdemy
 * @return the list of requested courses
 */
private List<Course> getCourses(Set<Integer> idsUdacity, Set<Integer> idsCoursera, Set<Integer> idsUdemy) {
    getCoursesUdemy(idsUdemy)+getCoursesCoursera(idsCoursera)+getCoursesUdacity(idsUdacity)
}

/**
 * Method that returns the list of courses of Udacity whose id belongs to the list of ids received in the API request.
 * @param idsUdacity
 * @return the list of requested courses
 */
private List<Course> getCoursesUdacity(Set<Integer> idsUdacity) {
    List<Course> output = new LinkedList<>()
    Course.withTransaction{
        idsUdacity?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udacity")
            if (course)
                output.add(course)
        }
    }
    output
}

/**
 * Method that returns the list of courses of Coursera whose id belongs to the list of ids received in the API request.
 * @param idsCoursera
 * @return the list of requested courses
 */
private List<Course> getCoursesCoursera(Set<Integer> idsCoursera) {
    List<Course> output = new LinkedList<>()
    Course.withTransaction{
        idsCoursera?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Coursera")
            if (course)
                output.add(course)
        }
    }
    output
}

/**
 * Method that returns the list of courses of Udemy whose id belongs to the list of ids received in the API request.
 * @param idsUdemy
 * @return the list of requested courses
 */
private List<Course> getCoursesUdemy(Set<Integer> idsUdemy) {
    List<Course> output = new LinkedList<>()
    Course.withTransaction{
        idsUdemy?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udemy")
            if (course)
                output.add(course)
        }
    }
    output
}

/**
 * Method used to generate the "context" parameter needed to make API requests.
 * @param user
 * @return the "context" object
 */
private def generateContext(User user) {
    if (!user)
        return ["discarded_courses": [],
                "language_list"    : LANGUAGES
        ]
    else {
        Set<Integer> bannedCourses = []
        Set<String> languages = (user?.languages) ?: []
        user?.lists?.each { CourseList courseList ->
            courseList?.courses?.each { Course course ->
                if (course?.idCurso)
                    bannedCourses.add(course.idCurso)
            }
        }
        bannedCourses=bannedCourses+user?.bannedCourses
        if (!languages)
            languages = LANGUAGES
        else if(languages?.contains("Chinese")){
            languages.remove("Chinese")
            languages.add("Traditional Chinese")
            languages.add("Simplified Chinese")
        }
        return ["discarded_courses": bannedCourses,
                "language_list"    : languages
        ]
    }
}

/**
 * Method used to generate the "profile" parameter needed to make API requests.
 * @param user
 * @return the "profile" object
 */
private def generateProfile(User user,boolean relatedTo) {
    if(!user)
        return [
                "description": " ",
                "difficulty": DEFAULT_DIFFICULTY,
                "duration": DEFAULT_DURATION,
                "free": DEFAULT_ISFREE,
                "students": DEFAULT_POPULARITY,
                "rating": DEFAULT_RATING,
                "institution": "Coursera",
                "cost": DEFAULT_COST
        ]
    else {
        List<Course> courses = user?.lists?.courses?.flatten()
        String description = " " + user?.interests?.join(" ")+
                ((user?.basicSkills) ? " "+user?.basicSkills?.collect{it?.name}?.join(" ") : "") +
                ((user?.mediumSkills) ? " "+user?.mediumSkills?.collect{it?.name}?.join(" ") : "") +
                ((user?.expertSkills) ? " "+user?.expertSkills?.collect{it?.name}?.join(" ") : "") +
                ((relatedTo) ? "" : ". "+courses?.collect{course -> course?.title}?.join(". "))
        String difficulty = calculateAvgDifficulty(courses,user)
        int free = calculateIsFree(courses)
        float rating = calculateAvgRating(courses)
        float duration = calculateAvgDuration(courses,user)
        float popularity = calculateAvgPopularity(courses,user)
        float cost = calculateAvgCost(courses,user)
        String institution = calculateMostFrequentInstitution(courses)
        return [
                "description": description,
                "difficulty": difficulty,
                "duration": duration,
                "free": free,
                "students": popularity,
                "rating": rating,
                "institution": institution,
                "cost": cost
        ]
    }

}

/**
 * Method used to calculate the "isFree" parameter of the "profile" object from the list of courses received as parameter.
 * @param courses
 * @return the "isFree" parameter value
 */
private int calculateIsFree(List<Course> courses){
    float accFree = 0
    int coursesWithIsFree = 0
    courses?.forEach{course ->
        if(course?.isFree != null){
            accFree=accFree + (course?.isFree == 2 ? 1 :
                    (course?.isFree == 3 ? 0 :
                            course?.isFree
                    )
            )
            coursesWithIsFree++
        }
    }
    //If there are enough courses with isFree in the user courseLists the result is the avg free
    if(coursesWithIsFree>0){
        float  isFree = Math.round((accFree/coursesWithIsFree)*100)/100
        return (isFree < 0.5 ? 0 : 1 )
        //Otherwise, the result is the default value
    }else
        return DEFAULT_ISFREE
}

/**
 * Method used to calculate the "difficulty" parameter of the "profile" object from the list of courses
 * and the user received as parameter.
 * @param courses
 * @param user
 * @return the "difficulty" parameter value
 */
private String calculateAvgDifficulty(List<Course> courses, User user){
    float accDifficulty = 0
    int coursesWithDifficulty = 0
    courses?.forEach{course ->
        if(course?.difficulty != null){
            accDifficulty=accDifficulty + (course?.difficulty == "advanced" ? 3 :
                    (course?.difficulty == "intermediate" ? 2 :
                            1
                    )
            )
            coursesWithDifficulty++
        }
    }
    //If there are enough courses with difficulty in the user courseLists the result is the avg difficulty
    if(coursesWithDifficulty>0 && accDifficulty>0){
        float  difficulty = Math.round((accDifficulty/coursesWithDifficulty)*100)/100
        return (difficulty < 1.66 ? "beginner" :
                (difficulty < 2.33 ? "intermediate" : "advanced")
        )
        //Otherwise, if the user is registered and has established a difficulty preference, that value is used
    }else if(user?.difficulty){
        return (user?.difficulty < 1.66 ? "beginner" :
                (user?.difficulty < 2.33 ? "intermediate" : "advanced")
        )
        //If the user hasn't established the difficulty preference the result is the default value
    }else
        return DEFAULT_DIFFICULTY
}

/**
 * Method used to calculate the "rating" parameter of the "profile" object from the list of courses received as parameter.
 * @param courses
 * @return the "rating" parameter value
 */
private Float calculateAvgRating(List<Course> courses){
    float accRating = 0
    int ratedCourses = 0
    courses?.forEach{course ->
        if(course?.rating != null){
            accRating=accRating+course?.rating
            ratedCourses++
        }
    }
    //If there are enough courses with rating in the user courseLists the result is the avg rating
    if(ratedCourses>0 && accRating>0)
        return Math.round((accRating/ratedCourses)*100)/100
    //Otherwise, the result is the default value
    else
        return DEFAULT_RATING
}

/**
 * Method used to calculate the "duration" parameter of the "profile" object from the list of courses
 * and the user received as parameter.
 * @param courses
 * @param user
 * @return the "duration" parameter value
 */
private Float calculateAvgDuration(List<Course> courses,User user){
    float accDuration = 0
    int coursesWithDuration = 0
    courses?.forEach{course ->
        if(course?.duration != null){
            accDuration=accDuration+course?.duration
            coursesWithDuration++
        }
    }
    //If there are enough courses with duration in the user courseLists the result is the avg duration
    if(coursesWithDuration>0)
        return Math.round((accDuration/coursesWithDuration)*100)/100
    //Otherwise, if the user is registered and has established a duration preference, that value is used
    else if(user?.duration)
        return user.duration*10 //between 10 and 30
    //If the user hasn't established the duration preference the result is the default value
    else
        return DEFAULT_DURATION
}

/**
 * Method used to calculate the "students" parameter of the "profile" object from the list of courses
 * and the user received as parameter.
 * @param courses
 * @param user
 * @return the "students" parameter value
 */
private Float calculateAvgPopularity(List<Course> courses,User user){
    float accPopularity = 0
    int coursesWithPopularity = 0
    courses?.forEach{course ->
        if(course?.popularity != null){
            accPopularity=accPopularity+course?.popularity
            coursesWithPopularity++
        }
    }
    //If there are enough courses with popularity in the user courseLists the result is the avg popularity
    if(coursesWithPopularity>0 && accPopularity>0)
        return Math.round((accPopularity/coursesWithPopularity)*100)/100
    //Otherwise, if the user is registered and has established a popularity preference, that value is used
    else if(user?.popularity)
        return user.popularity*250000 //between 250000 and 500000
    //If the user hasn't established the popularity preference the result is the default value
    else
        return DEFAULT_POPULARITY
}

/**
 * Method used to calculate the "cost" parameter of the "profile" object from the list of courses
 * and the user received as parameter.
 * @param courses
 * @param user
 * @return the "cost" parameter value
 */
private Float calculateAvgCost(List<Course> courses, User user){
    float accCost = 0
    int coursesWithCost= 0
    courses?.forEach{course ->
        if(course?.price != null){
            accCost=accCost+course?.price
            coursesWithCost++
        }
    }
    //If there are enough courses with cost in the user courseLists the result is the avg cost
    if(coursesWithCost>0)
        return Math.round((accCost/coursesWithCost)*100)/100
    //Otherwise, if the user is registered and has established a cost preference, that value is used
    else if(user?.cost)
        return user.cost<=1.2 ? 0 : user.cost*25 //between 25 and 75
    //If the user hasn't established the cost preference the result is the default value
    else
        return DEFAULT_COST
}

/**
 * Method used to calculate the "institution" parameter of the "profile" object from the list of courses received as parameter.
 * @param courses
 * @return the "institution" parameter value
 */
private String calculateMostFrequentInstitution(List<Course> courses){
    Map<String,Integer> institutions =  new HashMap<>()
    courses?.forEach{course ->
        if(course?.originalPage == "Coursera" && course?.author){
            Integer count = institutions.remove(course?.author)
            if(count)
                institutions.put(course?.author,++count)
            else
                institutions.put(course?.author,1)
        }
    }
    //If there are enough courses with institution in the user courseLists the result is the most frequent institution
    if(institutions.size()>0){
        String institution = institutions
                .entrySet()
                .stream()
                .reduce({ institution1, institution2 ->
                    institution1.value > institution2.value ? institution1 : institution2
                })
                .get()?.key
        return institution?: DEFAULT_INSTITUTION
        //Otherwise, the result is the default value
    }else
        return DEFAULT_INSTITUTION
}

/**
 * Method used to make the request to the API to obtain the explore recommendations for the user received as parameter of this method.
 * @param data
 * @param user
 * @return the list of recommended courses
 */
List<Course> getexploreCourses(User user) {
    try {
        RESTClient client = new RESTClient("http://165.227.230.218:80")
        client.defaultAcceptHeader = ContentType.JSON
        def path = "/explore/?k="
        if(user && user?.languages && !user?.languages?.contains("English")){
            path = path+"25"
        }else{
            path = path+"6"
        }
        def params = [
                "perfil":generateProfile(user,false),
                "contexto":generateContext(user)
        ]
        def response = client.post(path: path) {
            type ContentType.JSON
            json params
        }
        def slurper = new JsonSlurper()
        def responseData = slurper.parse(response.data)
        Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(2)
        Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(5)
        Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(5)
        return getCourses(idsUdacity, idsCoursera, idsUdemy)
    } catch (Exception e) {
        e.printStackTrace()
        return []
    }
}
//end::RecommenderService[]
//tag::main[]
initDatastore()

int nusers = 0
User.withTransaction {
    nusers = User?.count
}
println 'Generating explore recommendations for '+nusers+' users'
for (int i=1; i<=nusers;i++) {
    User user
    List<Course> exploreResults

    println 'Generating explore recommendations for user '+i

    User.withTransaction {
        user = User.get(i)
        if(user)
            exploreResults = getexploreCourses(user)
    }

    User.withTransaction {
        User updateUser = User.get(i)
        if(updateUser){
            updateUser?.exploreRecommendationsIds = exploreResults?.collect{it?.id as Long}
            updateUser?.save()
        }
    }

    println 'Explore recommendations successfully generated for user '+i
}
println 'Finished generating explore recommendations'
//end::main[]
