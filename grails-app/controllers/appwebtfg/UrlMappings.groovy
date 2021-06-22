package appwebtfg

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //Home mappings
        "/"(controller: "home", action:"index")

        //User mappings
        "/profile/$id"(controller: "user", action: "getPublicProfile")
        "/myProfile"(controller: "user", action: "myProfile")
        "/register"(controller: "user", action: "register")

        //Course mappings
        "/course/$id"(controller: "course", action: "getCourse")

        //Search mappings
        "/search/semanticSearch"(controller: "search", action: "semanticSearch")

        //CourseList mappings
        "/courseList/$id"(controller: "courseList", action: "getCourseList")
        "/myCourseList/$id"(controller: "courseList", action: "getMyCourseList")
        "/createCourseList/"(controller: "courseList", action: "createCourseList")
        "/deleteMyCourseList/$id"(controller: "courseList", action: "deleteMyCourseList")
        "/createCourseList/create"(controller: "courseList", action: "create")
        "/courseList/deleteCourseFromMyCourseList"(controller: "courseList", action: "deleteCourseFromMyCourseList")
        "/courseList/addCourseToMyCourseList"(controller: "courseList", action: "addCourseToMyCourseList")

        //Category mappings
        "/category/$id"(controller: "category", action: "getCategory")

        //Error mappings
        "500"(controller: "error", action: "internalError")
        "404"(controller: "error", action: "notFound")
        "403"(controller: "error", action: "notAllowed")
    }
}
