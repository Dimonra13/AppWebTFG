package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class CourseListController {

    SpringSecurityService springSecurityService
    CourseListService courseListService

    def index() { }

    @Secured(["permitAll"])
    def getCourseList(Long id){
        CourseList cl = CourseList.get(id)
        if(cl)
            render(view: 'courseList', model: [courseList:cl,isregistered: null])
        else
            render status: 404
    }

    @Secured('isAuthenticated()')
    def getMyCourseList(Long id){
        CourseList cl = CourseList.get(id)
        if(cl)
            render(view: 'courseList', model: [courseList:cl,isregistered: true])
        else
            render status: 404
    }

    @Secured('isAuthenticated()')
    def createCourseList(){
        render(view: 'createCourseList',model: [idCourse:params?.idCourse])
    }

    @Secured('isAuthenticated()')
    def create(){
        User authUser = springSecurityService.getCurrentUser() as User
        CourseList newcl = courseListService.createCourseList(authUser, params?.name, params?.description)
        if (newcl) {
            if(params?.idCourse){
                redirect(controller: "course",action: "getCourse", params: [id: params?.idCourse])
            } else {
                redirect(controller: "User", action: "myProfile")
            }
        } else {
            render(view: 'createCourseList', model: [error: true, idCourse: params?.idCourse])
        }
    }

    @Secured('isAuthenticated()')
    def deleteMyCourseList(Long id){
        User authUser = springSecurityService.getCurrentUser() as User
        courseListService.deleteCourseList(authUser, params?.id as Long)
        redirect(controller: "User", action: "myProfile")
    }

    @Secured('isAuthenticated()')
    def deleteCourseFromMyCourseList(){
        if(CourseList.get(params?.idList as Long)){
            courseListService.deleteCourseFromList(params?.idList as Long,params?.idCourse as Long)
            redirect(action: "getMyCourseList",params: [id:params?.idList as Long])
        }else{
            render status: 404
        }
    }

    @Secured('isAuthenticated()')
    def addCourseToMyCourseList(){
        if(CourseList.get(params?.idList as Long)){
            courseListService.addCourseToList(params?.idList as Long,params?.idCourse as Long)
            redirect(action: "getMyCourseList",params: [id:params?.idList as Long])
        }else{
            render status: 404
        }
    }
}
