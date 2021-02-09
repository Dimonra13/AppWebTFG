package appwebtfg

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class CourseController {

    def index() { }

    @Secured(["permitAll"])
    def getCourse(Long id){
        Course course = Course.get(id)
        if(course)
            render(view: "courseProfile", model: [course: course])
        else
            render status: 404
    }
}
