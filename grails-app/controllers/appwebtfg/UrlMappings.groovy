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

        //Course mappings
        "/course/$id"(controller: "course", action: "getCourse")

        //CourseList mappings
        "/myCourseList/$id"(controller: "courseList", action: "getMyCourseList")
        "/createCourseList/"(controller: "courseList", action: "createCourseList")
        "/deleteMyCourseList/$id"(controller: "courseList", action: "deleteMyCourseList")
        //Error mappings
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
