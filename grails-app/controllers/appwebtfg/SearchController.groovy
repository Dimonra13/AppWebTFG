package appwebtfg

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class SearchController {

    UserService userService
    CourseService courseService
    RecommenderService recommenderService
    SpringSecurityService springSecurityService
    UserFeedbackService userFeedbackService

    /**
     * Method the returns the page used for searching users with a certain name or email
     * @return view "search/user"
     */
    @Secured(["permitAll"])
    def user(){
    }

    /**
     * Method that returns the page used for searching users with a certain name or email, with the
     * results of the query paginated in pages of maximum 10 elements
     * @return view "search/user"
     */
    @Secured(["permitAll"])
    def searchUser(){
        String userData = params.get("userData")
        List<User> foundUsers = null
        boolean isMore = false;
        if(userData && userData!=""){
            if(!params.get("offset"))
                params.offset=0
            else
                params.offset=Integer.parseInt(params.get("offset"))
            foundUsers = userService.findUsers(userData,userData,10,params.offset)
            isMore = userService.findUsers(userData,userData,10,params.offset+10) as boolean
        }
        render(view: "user", model: [userData: userData,foundUsers: foundUsers,search: true,isMore: isMore,params:params])
    }

    /**
     * Method the returns the page used for searching courses with a certain title
     * @return view "search/course"
     */
    @Secured(["permitAll"])
    def course() {
    }

    /**
     * Method that returns the page used for searching courses, with the results of the query
     * paginated in pages of maximum 10 elements
     * @return view "search/course"
     */
    @Secured(["permitAll"])
    def searchCourse(){
        int pageSize
        int offset
        String title = null
        String sortBy
        boolean sortByAsc
        boolean freeOnly = params.freeOnly as boolean
        boolean englishOnly = params.englishOnly as boolean
        String difficulty = null
        String ogpage = null
        if(params.get("customSearch")){
            pageSize=Integer.parseInt(params.pageSize)
            if(params.offset)
                offset=Integer.parseInt(params.offset)
            else
                offset=(Integer.parseInt(params.page)-1)*pageSize
            if(params.title)
                title=params.title
            if(params.sortBy == g.message(code: "categoryIndex.sortBy.rating")){
                sortBy='rating'
                sortByAsc=false
            }else if(params.sortBy == g.message(code: "categoryIndex.sortBy.A-Z")){
                sortBy='title'
                sortByAsc=true
            }else if(params.sortBy == g.message(code: "categoryIndex.sortBy.Z-A")){
                sortBy='title'
                sortByAsc=false
            }else{
                sortBy=null
                sortByAsc=false
            }
            if(params.difficulty == g.message(code: "categoryIndex.difficulty.beginner"))
                difficulty= 'beginner'
            else if(params.difficulty == g.message(code: "categoryIndex.difficulty.intermediate"))
                difficulty= 'intermediate'
            else if(params.difficulty == g.message(code: "categoryIndex.difficulty.advanced"))
                difficulty= 'advanced'
            if(params.ogpage)
                ogpage=(params.ogpage==g.message(code: "course.search.ogpage.all"))? null : params.ogpage
        }else{
            pageSize=12
            offset=0
            sortBy=null
            sortByAsc=false
        }
        List<Course> courses = courseService.findCourses(null,pageSize,offset,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage)
        boolean isMore = courseService.findCourses(null,pageSize,offset+pageSize,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage) as boolean
        render(view: "course",model: [
                courses: courses,
                isMore: isMore,
                pageSize: pageSize,
                offset: offset,
                title: title,
                freeOnly: freeOnly,
                englishOnly: englishOnly,
                difficulty: params.difficulty,
                ogpage: ogpage,
                sortBy: params.sortBy,
                customSearch: "true"
        ])
    }

    @Secured(["permitAll"])
    def semantic(){
    }

    @Secured(["permitAll"])
    def semanticSearch(){
        User authUser = springSecurityService.getCurrentUser() as User
        Integer bannedCourse = params.get("bannedCourse") as Integer
        List<Course> foundCourses = null
        String isLast = null
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,Course?.get(bannedCourse)?.idCurso)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> searchIDs
            if(!params.isLast){
                searchIDs = params.get("searchIDs").collect{it->Integer.parseInt(it)}
                if (searchIDs.size()==2)
                    isLast="true"
            }else{
                searchIDs = new LinkedList<>();
                searchIDs.add(params.get("searchIDs") as Integer)
                isLast=null
            }
            foundCourses = courseService.getCourses(searchIDs)
        }else{
            String data = params.get("courseData")
            if(data && data!=""){
                foundCourses =  recommenderService.semanticSearch(data,authUser)
            }
        }
        render(view: "semantic", model: [foundCourses: foundCourses,search: true,isLast:isLast,user:authUser])
    }
}
