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

        //Course mappings
        "/course/$id"(controller: "course", action: "getCourse")

        //CourseList mappings
        "/courseList/$id"(controller: "courseList", action: "getCourseList")
        "/myCourseList/$id"(controller: "courseList", action: "getMyCourseList")
        "/createCourseList/"(controller: "courseList", action: "createCourseList")
        "/deleteMyCourseList/$id"(controller: "courseList", action: "deleteMyCourseList")
        "/createCourseList/create"(controller: "courseList", action: "create")

        //Error mappings
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
