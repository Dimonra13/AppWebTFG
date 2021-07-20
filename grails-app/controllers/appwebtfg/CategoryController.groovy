package appwebtfg

import grails.gorm.PagedResultList
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class CategoryController {

    CourseService courseService

    Set<String> categories = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Business-Finance',
                              'Security','Leadership','Entrepreneurship','Personal-Development','Human-Studies','Education','Arts',
                              'Maths','Health','Science','Marketing','Architecture','Software-Engineering','IT-Certification','Test-Prep',
                              'Graphic-Design','Gaming','Google','Apple','Oracle','Microsoft','SAP']
    Set <String> science = ['Data-Science','Machine-Learning','Cloud-Computing','Engineering','Security',
                            'Software-Engineering','Maths','Science','Gaming','IT-Certification',
                            'Test-Prep','Architecture']
    Set<String> humanities = ['Business-Finance','Leadership','Entrepreneurship','Personal-Development',
                              'Human-Studies','Arts','Education','Health','Marketing','Graphic-Design']
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

    /**
     * Method that returns the page of a category if it exists or error 404 otherwise
     * @param id
     * @return view "categoriesIndex" or status 404
     */
    @Secured(["permitAll"])
    def getCategory(String id) {
        if(!id||!categories.contains(id))
            render status: 404
        else{
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
            PagedResultList<Course> courses = courseService.findCourses(id,pageSize,offset,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage,max,min,queryList)
            boolean isMore = courseService.findCourses(id,pageSize,offset+pageSize,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty,ogpage,max,min,queryList) as boolean
            render(view: "categoriesIndex",model: [
                    currentCategory: id,
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
                    categoryGroup: science.contains(id) ? "science" : humanities.contains(id) ? "humanities" : "brands"
            ])
        }
    }
}
