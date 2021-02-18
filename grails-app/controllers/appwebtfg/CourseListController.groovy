package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

/**
 * Controller used to manage HTTP requests related to courseLists
 */
class CourseListController {

    SpringSecurityService springSecurityService
    CourseListService courseListService

    def index() {}

    /**
     * Method that returns the public page of a courseList if it exists or error 404 otherwise
     * @param id
     * @return view "courseList" or status 404
     */
    @Secured(["permitAll"])
    def getCourseList(Long id) {
        CourseList cl = CourseList.get(id)
        if (cl)
            render(view: 'courseList', model: [courseList: cl, isregistered: null])
        else
            render status: 404
    }

    /**
     * Method that returns the private page of a courseList if it exists or error 404 otherwise. This private page
     * allows the user to edit the courseList name and content.
     * @param id
     * @return view "courseList" or status 404
     */
    @Secured('isAuthenticated()')
    def getMyCourseList(Long id) {
        CourseList cl = CourseList.get(id)
        if (cl)
            render(view: 'courseList', model: [courseList: cl, isregistered: true])
        else
            render status: 404
    }

    /**
     * Method that returns the page used to create a new courseList
     * @return view "createCourseList"
     */
    @Secured('isAuthenticated()')
    def createCourseList() {
        render(view: 'createCourseList', model: [idCourse: params?.idCourse])
    }

    /**
     * Method used to create a new courseList for the user. If idCourse is not null the origin of the request is
     * "/course/$idCourse" else the origin of the request is "/user/myProfile", so the redirect output depends of the
     * origin of the request. In case of an error the view 'createCourseList' is rendered instead.
     * @param idCourse
     * @return redirect to "/user/myProfile", "/course/getCourse" or "/createCourseList"
     */
    @Secured('isAuthenticated()')
    def create() {
        User authUser = springSecurityService.getCurrentUser() as User
        CourseList newcl = courseListService.createCourseList(authUser, params?.name, params?.description)
        if (newcl) {
            if (params?.idCourse) {
                redirect(controller: "course", action: "getCourse", params: [id: params?.idCourse])
            } else {
                redirect(controller: "User", action: "myProfile")
            }
        } else {
            render(view: 'createCourseList', model: [error: true, idCourse: params?.idCourse])
        }
    }

    /**
     * Method used to delete the courseList with id=params.id for the user.
     * @param id
     * @return redirect to "/user/myProfile"
     */
    @Secured('isAuthenticated()')
    def deleteMyCourseList(Long id) {
        User authUser = springSecurityService.getCurrentUser() as User
        courseListService.deleteCourseList(authUser, id)
        redirect(controller: "User", action: "myProfile")
    }

    /**
     * Method used to delete the course with id=params.idCourse from the courseList with id=params.idList if the
     * course and courseList exist.
     * @param idCourse , idList
     * @return redirect to "/getMyCourseList/$idCourse" or status 404
     */
    @Secured('isAuthenticated()')
    def deleteCourseFromMyCourseList() {
        if (CourseList.get(params?.idList as Long)) {
            courseListService.deleteCourseFromList(params?.idList as Long, params?.idCourse as Long)
            redirect(action: "getMyCourseList", params: [id: params?.idList as Long])
        } else {
            render status: 404
        }
    }

    /**
     * Method used to add the course with id=params.idCourse to the courseList with id=params.idList if these
     * course and courseList exist.
     * @param idCourse , idList
     * @return redirect to "/getMyCourseList/$idCourse" or status 404
     */
    @Secured('isAuthenticated()')
    def addCourseToMyCourseList() {
        if (CourseList.get(params?.idList as Long)) {
            courseListService.addCourseToList(params?.idList as Long, params?.idCourse as Long)
            redirect(action: "getMyCourseList", params: [id: params?.idList as Long])
        } else {
            render status: 404
        }
    }
}
