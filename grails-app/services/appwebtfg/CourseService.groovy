package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    List<Course> findCoursesByCategory(String category){
        Course.createCriteria().list {
            eq("category",category)
        } as List<Course>
    }
}
