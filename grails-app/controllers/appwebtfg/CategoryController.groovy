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
            if(params.get("customSearch")){
                pageSize=Integer.parseInt(params.pageSize)
                offset=Integer.parseInt(params.offset)
            }else{
                pageSize=12
                offset=0
            }
            List<Course> courses = courseService.findCoursesByCategory(id,pageSize,offset)
            boolean isMore = courseService.findCoursesByCategory(id,pageSize,offset+pageSize) as boolean
            render(view: "categoriesIndex",model: [
                    currentCategory: id,
                    courses: courses,
                    isMore: isMore,
                    pageSize: pageSize,
                    offset: offset,
                    categoryGroup: science.contains(id) ? "science" : humanities.contains(id) ? "humanities" : "brands"
            ])
        }
    }
}
