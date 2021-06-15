package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    /**
     * Method to get all the courses of the specified category paginated with offset $offset and page size $max
     * @param category
     * @param max
     * @param offset
     * @return
     */
    List<Course> findCoursesByCategory(String category,int max, int offset){
        Course.createCriteria().list(max:max,offset:offset) {
            eq("category",category)
        } as List<Course>
    }

    /**
     * Method to get all the courses with paginated with offset $offset and page size $max
     * @param title
     * @param max
     * @param offset
     * @return
     */
    List<Course> findCoursesByTitle(String title, int max, int offset){
        Course.createCriteria().list(max:max,offset:offset) {
            ilike("title","%${title}%")
        } as List<Course>
    }
}
