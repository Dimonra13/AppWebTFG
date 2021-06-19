package appwebtfg

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
            }else{
                pageSize=12
                offset=0
                sortBy=null
                sortByAsc=false
            }
            List<Course> courses = courseService.findCourses(id,pageSize,offset,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty)
            boolean isMore = courseService.findCourses(id,pageSize,offset+pageSize,title,freeOnly,englishOnly,sortBy,sortByAsc,difficulty) as boolean
            render(view: "categoriesIndex",model: [
                    currentCategory: id,
                    courses: courses,
                    isMore: isMore,
                    pageSize: pageSize,
                    offset: offset,
                    title: title,
                    freeOnly: freeOnly,
                    englishOnly: englishOnly,
                    difficulty: params.difficulty,
                    sortBy: params.sortBy,
                    categoryGroup: science.contains(id) ? "science" : humanities.contains(id) ? "humanities" : "brands"
            ])
        }
    }
}
