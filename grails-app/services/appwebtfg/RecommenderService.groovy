package appwebtfg

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper
import wslite.rest.*
import java.nio.charset.*
import grails.util.Environment
@Transactional
class RecommenderService {
    final String URL = (Environment.current == Environment.PRODUCTION) ? "http://165.227.230.218:80" : "http://localhost:8011"
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
            def path = "/courses/global/search/?query=" + data + "&k=10"
            def params = generateContext(user)
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }.take(5)
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }.take(10)
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }.take(10)
            return getCourses(idsUdacity, idsCoursera, idsUdemy).toSet().toList()
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    /**
     * Method used to make the request to the API to obtain the courses related to the course received as parameter of this method.
     * @param course
     * @param user
     * @return the list of related courses
     */
    List<Course> getRelatedCourses(Course course, User user) {
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
            def path = endpoint+"?k=3"
            def params = [
                          "perfil":generateProfile(user),
                          "contexto":generateContext(user)
                         ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }
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
            def path = "/courses/global/recommend/profile?k=4"
            def params = [
                    "perfil":generateProfile(user),
                    "contexto":generateContext(user)
            ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            return getCourses(idsUdacity, idsCoursera, idsUdemy)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    /**
     * Method used to make the request to the API to obtain the courses related with a query recommended for the user
     * received as parameter of this method.
     * @param data
     * @param user
     * @return the list of recommended courses
     */
    List<Course> getRecommendedCoursesRelatedToQuery(User user,String query) {
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            String data = URLEncoder.encode(query, StandardCharsets.UTF_8.toString())
            def path = "/courses/global/recommend/query?query=" + data + "&k=1"
            def params = [
                    "perfil":generateProfile(user),
                    "contexto":generateContext(user)
            ]
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map)?.keySet()?.collect { Integer.parseInt(it) }
            return getCourses(idsUdacity, idsCoursera, idsUdemy)
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
                courseList.courses.each { Course course ->
                    if (course.idCurso)
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
    private def generateProfile(User user) {
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
            String description = " " + user?.interests?.join(",")+
                    (user?.basicSkills) ? ","+user?.basicSkills?.collect{it.name}?.join(",") : "" +
                    (user?.mediumSkills) ? ","+user?.mediumSkills?.collect{it.name}?.join(",") : "" +
                    (user?.expertSkills) ? ","+user?.expertSkills?.collect{it.name}?.join(",") : ""
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
        if(coursesWithIsFree>0 && accFree>0){
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
                accDifficulty=accDifficulty + (course?.difficulty == "beginner" ? 1 :
                                                (course?.difficulty == "intermediate" ? 2 :
                                                        3
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
                                    .get().key
            return institution?: DEFAULT_INSTITUTION
            //Otherwise, the result is the default value
        }else
            return DEFAULT_INSTITUTION
    }

}
