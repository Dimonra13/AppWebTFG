package appwebtfg

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper
import wslite.rest.*
import java.nio.charset.*

@Transactional
class RecomenderService {
    final String URL = "http://0.0.0.0:8011"
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

    List<Course> semanticSearch(String data, User user) {
        try {
            RESTClient client = new RESTClient(URL)
            client.defaultAcceptHeader = ContentType.JSON
            data = URLEncoder.encode(data, StandardCharsets.UTF_8.toString())
            def path = "/search_courses_global/?query=" + data + "&k=5"
            def params = generateContext(user)
            def response = client.post(path: path) {
                type ContentType.JSON
                json params
            }
            def slurper = new JsonSlurper()
            def responseData = slurper.parse(response.data)
            Set<Integer> idsUdacity = (responseData.get("courses_udacity") as Map).keySet().collect { Integer.parseInt(it) }
            Set<Integer> idsCoursera = (responseData.get("courses_coursera") as Map).keySet().collect { Integer.parseInt(it) }
            Set<Integer> idsUdemy = (responseData.get("courses_udemy") as Map).keySet().collect { Integer.parseInt(it) }
            return getCourses(idsUdacity, idsCoursera, idsUdemy)
        } catch (Exception e) {
            e.printStackTrace()
            return []
        }
    }

    private def generateContext(User user) {
        if (!user)
            return ["discarded_courses": [],
                    "language_list"    : LANGUAGES
            ]
        else {
            Set<Integer> bannedCourses = []
            Set<String> languages = []
            user.lists.each { CourseList courseList ->
                courseList.courses.each { Course course ->
                    if (course.idCurso)
                        bannedCourses.add(course.idCurso)
                    if (course.language)
                        languages.add(course.language)
                }
            }
            if (!languages)
                languages = LANGUAGES
            return ["discarded_courses": bannedCourses,
                    "language_list"    : languages
            ]
        }
    }

    private List<Course> getCourses(Set<Integer> idsUdacity, Set<Integer> idsCoursera, Set<Integer> idsUdemy) {
        List<Course> output = new LinkedList<>()
        idsUdacity.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udacity")
            if (course)
                output.add(course)
        }
        idsCoursera.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Coursera")
            if (course)
                output.add(course)
        }
        idsUdemy.forEach { Integer courseID ->
            Course course = Course.findByIdCursoAndOriginalPage(courseID, "Udemy")
            if (course)
                output.add(course)
        }
        output
    }
}
