package appwebtfg

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper
import wslite.rest.*
import java.nio.charset.*
import grails.util.Environment

import java.util.stream.Collectors

@Transactional
class RecommenderService {
    final String URL = (Environment.current == Environment.PRODUCTION) ? "http://recommender:8011" : "http://localhost:80"
    final def LANGUAGES = [
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
    final float DEFAULT_RATING = 4.5
    final float DEFAULT_DURATION = 18.050667
    final float DEFAULT_POPULARITY = 383077.8
    final float DEFAULT_COST = 57.3941
    final String DEFAULT_DIFFICULTY = "beginner"
    final int DEFAULT_ISFREE = 1
    final String DEFAULT_INSTITUTION = "Coursera"

    final Set<String> brands = ['Google','Apple','Oracle','Microsoft','SAP']
    final Set<String> science = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Security',
                                 'Software-Engineering','Maths','Science','Gaming','IT-Certification',
                                 'Test-Prep','Architecture']
    final Set<String> humanities = ['Business-Finance','Leadership','Entrepreneurship','Personal-Development',
                                    'Human-Studies','Arts','Education','Health','Marketing','Graphic-Design']
    /**
     * Method used to make the API request to obtain the semantic search results and return the list of corresponding courses.
     * @param data
     * @param user
     * @return the list of courses resulting from the semantic search
     */
    List<Course> semanticSearch(String data, User user) {
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            data = URLEncoder.encode(data.toLowerCase(), StandardCharsets.UTF_8.toString())
            def path = "/courses/global/search/?query=" + data
            if(user && user?.languages && !user?.languages?.contains("English")){
                path = path + "&k=80"
            }else{
                path = path + "&k=12"
            }
            def params = generateContext(user)
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(2)
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(11)
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(11)
            return (getCoursesUdemy(idsUdemy) + getCoursesCoursera(idsCoursera))?.toSet()?.toList() + getCoursesUdacity(idsUdacity)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    /**
     * Method used to make the requests to the API to obtain the courses related to the course received as parameter of this method.
     * @param course
     * @param user
     * @return the list of related courses
     */
    List<Course> getRelatedCourses(Course course, User user) {
        if(user&&user?.interests){
            List<String> scienceInterests = new ArrayList<>()
            List<String> humanitiesInterests = new ArrayList<>()
            List<String> brandsInterests = new ArrayList<>()
            user?.interests.each {String interest ->
                if(science.contains(interest))
                    scienceInterests.add(interest)
                else if(humanities.contains(interest))
                    humanitiesInterests.add(interest)
                else if(brands.contains(interest))
                    brandsInterests.add(interest)
            }
            if(scienceInterests.isEmpty()){
                if(humanitiesInterests.isEmpty()){
                    return getRelatedCourses(course,user,5,brandsInterests,1,4,3)
                }else{
                    if(brandsInterests.isEmpty()){
                        return getRelatedCourses(course,user,5,humanitiesInterests,1,4,3)
                    }else{
                        return (getRelatedCourses(course,user,3,humanitiesInterests,1,2,1) +
                                getRelatedCourses(course,user,4,brandsInterests,0,4,4))
                                .stream().distinct().collect(Collectors.toList()).take(8)
                    }
                }
            }else{
                if(humanitiesInterests.isEmpty()){
                    if(brandsInterests.isEmpty()){
                        return getRelatedCourses(course,user,5,scienceInterests,1,4,3)
                    }else{
                        return (getRelatedCourses(course,user,3,scienceInterests,1,2,1) +
                                getRelatedCourses(course,user,4,brandsInterests,0,4,4))
                                .stream().distinct().collect(Collectors.toList()).take(8)
                    }
                }else{
                    if(brandsInterests.isEmpty()){
                        return (getRelatedCourses(course,user,3,scienceInterests,1,2,1) +
                                getRelatedCourses(course,user,4,humanitiesInterests,0,4,4))
                                .stream().distinct().collect(Collectors.toList()).take(8)
                    }else{
                        return (getRelatedCourses(course,user,3,humanitiesInterests,1,1,1) +
                                getRelatedCourses(course,user,3,brandsInterests,0,1,2) +
                                getRelatedCourses(course,user,5,scienceInterests,0,5,2))
                                .stream().distinct().collect(Collectors.toList()).take(8)
                    }
                }
            }
        }else{
            return getRelatedCourses(course,user,5,null,1,4,3)
        }
    }

    /**
     * Method used to make the request to the API to obtain the specified amount of courses related to the course
     * received as parameter of this method.
     * @param course
     * @param user
     * @param k
     * @param userInterests
     * @param nUdacity
     * @param nUdemy
     * @param nCoursera
     * @return the list of related courses
     */
    List<Course> getRelatedCourses(Course course, User user, int k,List<String> userInterests,int nUdacity,int nUdemy,int nCoursera) {
        if(!course || !course?.idCurso)
            return []
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            String endpoint
            if(course.originalPage == "Coursera"){
                endpoint = "/courses/coursera/"+ course.idCurso +"/related"
            }else if(course.originalPage == "Udacity"){
                endpoint = "/courses/udacity/"+ course.idCurso +"/related"
            }else{
                endpoint = "/courses/udemy/"+ course.idCurso +"/related"
            }
            def path
            if(user && user?.languages && !user?.languages?.contains("English")){
                path = endpoint+"?k=" + (k*5)
            }else{
                path = endpoint+"?k=${k}"
            }

            def params = [
                          "perfil":generateProfile(user,true,userInterests),
                          "contexto":generateContext(user)
                         ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.findAll{it != course?.idCurso}?.take(nUdacity)
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.findAll{it != course?.idCurso}?.take(nCoursera)
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.findAll{it != course?.idCurso}?.take(nUdemy)
            return getCourses(idsUdacity, idsCoursera, idsUdemy)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    /**
     * Method used to make the request to the API to obtain the courses recommended for the user received as parameter of this method.
     * @param data
     * @param user
     * @return the list of recommended courses
     */
    List<Course> getRecommendedCourses(User user) {
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            def path = "/courses/global/recommend/profile?k="
            if(user && user?.languages && !user?.languages?.contains("English")){
                path = path+"60"
            }else{
                path = path+"11"
            }
            def params = [
                    "perfil":generateProfile(user,false,null),
                    "contexto":generateContext(user)
            ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(2)
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(11)
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(11)
            return getCourses(idsUdacity, idsCoursera, idsUdemy)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    /**
     * Method used to make the requests to the API to obtain the courses related with a query recommended for the user
     * received as parameter of this method.
     * @param data
     * @param user
     * @return the list of recommended courses
     */
    List<Course> getRecommendedCoursesRelatedToQuery(User user,String query,int k) {
        if(user&&user?.interests){
            List<String> scienceInterests = new ArrayList<>()
            List<String> humanitiesInterests = new ArrayList<>()
            List<String> brandsInterests = new ArrayList<>()
            user?.interests.each {String interest ->
                if(science.contains(interest))
                    scienceInterests.add(interest)
                else if(humanities.contains(interest))
                    humanitiesInterests.add(interest)
                else if(brands.contains(interest))
                    brandsInterests.add(interest)
            }
            if(scienceInterests.isEmpty()){
                if(humanitiesInterests.isEmpty()){
                    return getRecommendedCoursesRelatedToQuery(user,query,k,brandsInterests)
                }else{
                    if(brandsInterests.isEmpty()){
                        return getRecommendedCoursesRelatedToQuery(user,query,k,humanitiesInterests)
                    }else{
                        return (getRecommendedCoursesRelatedToQuery(user,query,(k/2) as int,humanitiesInterests) +
                                getRecommendedCoursesRelatedToQuery(user,query,k,brandsInterests))
                                .stream().distinct().collect(Collectors.toList()).take(k*2)
                    }
                }
            }else{
                if(humanitiesInterests.isEmpty()){
                    if(brandsInterests.isEmpty()){
                        return getRecommendedCoursesRelatedToQuery(user,query,k,scienceInterests)
                    }else{
                        return (getRecommendedCoursesRelatedToQuery(user,query,(k/2) as int,scienceInterests) +
                                getRecommendedCoursesRelatedToQuery(user,query,k,brandsInterests))
                                .stream().distinct().collect(Collectors.toList()).take(k*2)
                    }
                }else{
                    if(brandsInterests.isEmpty()){
                        return (getRecommendedCoursesRelatedToQuery(user,query,(k/2) as int,scienceInterests) +
                                getRecommendedCoursesRelatedToQuery(user,query,k,humanitiesInterests))
                                .stream().distinct().collect(Collectors.toList()).take(k*2)
                    }else{
                        return (getRecommendedCoursesRelatedToQuery(user,query,(k/3) as int,brandsInterests) +
                                getRecommendedCoursesRelatedToQuery(user,query,(k/3) as int,humanitiesInterests)+
                                getRecommendedCoursesRelatedToQuery(user,query,k,scienceInterests))
                                .stream().distinct().collect(Collectors.toList()).take(k*2)
                    }
                }
            }
        }else{
            return getRecommendedCoursesRelatedToQuery(user,query,k,null)
        }
    }

    /**
     * Method used to make the request to the API to obtain the specified amount of courses related with a query
     * recommended for the user received as parameter of this method.
     * @param user
     * @param query
     * @param k
     * @param userInterests
     * @return the list of recommended courses
     */
    List<Course> getRecommendedCoursesRelatedToQuery(User user,String query,int k,List<String> userInterests) {
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            String data = URLEncoder.encode(query, StandardCharsets.UTF_8.toString())
            def path = "/courses/global/recommend/query?query=" + data
            if(user && user?.languages && !user?.languages?.contains("English")){
                path = path+"&k=" + (k*5)
            }else{
                path = path+"&k=${k}"
            }
            def params = [
                    "perfil":generateProfile(user,true,userInterests),
                    "contexto":generateContext(user)
            ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(k)
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }?.take(k)
            return getCourses(null, idsCoursera, idsUdemy)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

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
        idsUdacity?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udacity")
            if (course)
                output.add(course)
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
        idsCoursera?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Coursera")
            if (course)
                output.add(course)
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
        idsUdemy?.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udemy")
            if (course)
                output.add(course)
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
    private def generateProfile(User user,boolean relatedTo,List<String> userInterests) {
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
            String description = " " +
                    ((userInterests)? userInterests?.join(" ") : user?.interests?.join(" "))+
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
        if(institutions?.size()>0){
            String institution = institutions
                                    .entrySet()
                                    .stream()
                                    .reduce({ institution1, institution2 ->
                                        institution1?.value > institution2?.value ? institution1 : institution2
                                    })
                                    .get()?.key
            return institution?: DEFAULT_INSTITUTION
            //Otherwise, the result is the default value
        }else
            return DEFAULT_INSTITUTION
    }

}
