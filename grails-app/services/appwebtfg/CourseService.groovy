package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    List<Course> findCoursesByCategory(String category){
        Course.createCriteria().list {
            eq("category",category)
        } as List<Course>
    }

    List<Course> findCoursesByTitle(String title, int max, int offset){
        Course.createCriteria().list(max:max,offset:offset) {
            ilike("title","%${title}%")
        } as List<Course>
    }
}
