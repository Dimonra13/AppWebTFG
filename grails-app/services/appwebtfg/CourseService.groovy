package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    /**
     * Method to get all the courses of the specified category that meet the search criteria received as parameter
     * paginated with offset $offset and page size $max and order by $sortBy and $sortByAsc (if present)
     * @param category
     * @param max
     * @param offset
     * @param title
     * @param freeOnly
     * @param englishOnly
     * @param sortBy
     * @param sortByAsc
     * @param difficulty
     * @return the list of courses that meet these criteria
     */
    List<Course> findCourses(String category, int max, int offset, String title, boolean freeOnly, boolean englishOnly, String sortBy, boolean sortByAsc, String difficulty){
        Course.createCriteria().list(max:max,offset:offset) {
            eq("category",category)
            if(title) ilike("title","%${title}%")
            if (freeOnly) or{
                eq("isFree",1)
                eq("isFree",2)
            }
            if(englishOnly) or{
                eq("language","English")
                eq("language","english")
            }
            if(difficulty) eq("difficulty",difficulty)
            if(sortBy) order sortBy, sortByAsc ? 'asc' : 'desc'
        } as List<Course>
    }

    /**
     * Method to get all the courses with paginated with offset $offset and page size $max
     * @param title
     * @param max
     * @param offset
     * @return the list of courses that meet these criteria
     */
    List<Course> findCoursesByTitle(String title, int max, int offset){
        Course.createCriteria().list(max:max,offset:offset) {
            ilike("title","%${title}%")
        } as List<Course>
    }
}
