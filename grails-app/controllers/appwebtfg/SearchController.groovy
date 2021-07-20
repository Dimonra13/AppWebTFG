package appwebtfg

import grails.gorm.PagedResultList
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
        final int PAGE_SIZE = 10
        String userData = params.get("userData")
        int offset = 0
        PagedResultList<User> foundUsers = null
        boolean isMore = false;
        if(userData && userData!=""){
            if(params.get("offset"))
                offset=Integer.parseInt(params.get("offset"))
            foundUsers = userService.findUsers(userData,userData,PAGE_SIZE,offset)
            isMore = userService.findUsers(userData,userData,PAGE_SIZE,offset+PAGE_SIZE) as boolean
        }
        render(view: "user", model: [userData: userData,
                                     foundUsers: foundUsers,
                                     offset: offset,
                                     page:offset ? (offset/PAGE_SIZE)+1 : 1,
                                     lastPage: foundUsers?.totalCount ? ( (foundUsers?.totalCount%PAGE_SIZE) ? (foundUsers?.totalCount/PAGE_SIZE)+1 as int : (foundUsers?.totalCount/PAGE_SIZE) as int) : 1,
                                     isMore: isMore,
                                     search: true,
                                     params:params])
    }

    List<String> languages = [
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
            "Chinese",
            "Japanese",
            "Polish",
            "Hindi",
            "Russian",
            "Vietnamese",
            "Thai",
            "Dutch",
            "Kazakh",
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

    Set<String> categories = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                              'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                              'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                              'Graphic-Design','Gaming','Google','Oracle','Microsoft','SAP']

    /**
     * Method the returns the page used for searching courses
     * @return view "search/course"
     */
    @Secured(["permitAll"])
    def course() {
        render(view: "course", model: [languages:(["all"]+languages) as List<String>,
                                       languageList:["all"],
                                       categories: (["all"]+categories) as List<String>,
                                       category: (params?.category)?: "all"
                                      ])
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
        Float min = null
        Float max = null
        List<String> languageList = languages
        String category = null
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
            }else if(params.sortBy == g.message(code: "categoryIndex.sortBy.price.asc")){
                sortBy='price'
                sortByAsc=true
            }else if(params.sortBy == g.message(code: "categoryIndex.sortBy.price.desc")){
                sortBy='price'
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
            if(params.min)
                min = Float.parseFloat(params.min)
            if(params.max)
                max = Float.parseFloat(params.max)
            if(params.languageList){
                try{
                    languageList = params.languageList
                }catch(Exception e){
                    languageList = new LinkedList<>();
                    languageList.add(params.languageList)
                }
                if(languageList.contains("all"))
                    languageList=languages
            }
            if(params?.category && params?.category!="all")
                category = params.category
        }else{
            pageSize=12
            offset=0
            sortBy=null
            sortByAsc=false
        }
        List<String> queryList = languageList.clone()
        if(queryList?.contains("Chinese")){
            queryList.remove("Chinese")
            queryList.add("Traditional Chinese")
            queryList.add("Simplified Chinese")
        }
        PagedResultList<Course> courses = courseService.findCourses(category,pageSize,offset,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage,max,min,queryList)
        boolean isMore = courseService.findCourses(category,pageSize,offset+pageSize,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage,max,min,queryList) as boolean
        render(view: "course",model: [
                courses: courses,
                isMore: isMore,
                pageSize: pageSize,
                offset: offset,
                page:offset ? (offset/pageSize)+1 : 1,
                lastPage: courses?.totalCount ? ( (courses?.totalCount%pageSize) ? (courses?.totalCount/pageSize)+1 as int : (courses?.totalCount/pageSize) as int) : 1,
                title: title,
                ogpage: params?.ogpage,
                freeOnly: freeOnly,
                englishOnly: englishOnly,
                difficulty: params?.difficulty,
                sortBy: params?.sortBy,
                min: params?.min,
                max: params?.max,
                languages: (["all"]+languages) as List<String>,
                languageList: (languageList == languages)? ["all"] : languageList,
                categories: (["all"]+categories) as List<String>,
                category: (params?.category)?: "all",
                customSearch: "true"
        ])
    }

    /**
     * Method the returns the page used for searching courses using the semantic search of the API
     * @return view "search/semantic"
     */
    @Secured(["permitAll"])
    def semantic(){
    }

    /**
     * Method the returns the page used for searching courses using the semantic search of the API, with the results of the query
     * @return view "search/semantic"
     */
    @Secured(["permitAll"])
    def semanticSearch(){
        User authUser = springSecurityService.getCurrentUser() as User
        Integer bannedCourse = params.get("bannedCourse") as Integer
        List<Course> foundCourses = null
        String isLast = null
        String data = params.get("courseData")
        if(bannedCourse && authUser){
            userService.saveBannedCourse(authUser,Course?.get(bannedCourse)?.idCurso)
            if(!authUser?.feedback)
                userFeedbackService.createUserFeedback(authUser)
            userFeedbackService.updateNotInterested(authUser,Course?.get(bannedCourse)?.originalPage)
            List<Integer> searchIDs
            if(!params.isLast){
                searchIDs = params?.get("searchIDs")?.collect{it->Integer.parseInt(it)}
                if (searchIDs?.size()==2)
                    isLast="true"
            }else{
                searchIDs = new LinkedList<>();
                searchIDs.add(params.get("searchIDs") as Integer)
                isLast=null
            }
            foundCourses = courseService.getCourses(searchIDs)
        }else{
            if(data && data!=""){
                foundCourses =  recommenderService.semanticSearch(data,authUser)
            }
        }
        render(view: "semantic", model: [foundCourses: foundCourses,search: true,isLast:isLast,user:authUser,courseData:data])
    }
}
