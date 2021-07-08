package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseService {

    /**
     * Method to get all the courses that meet the search criteria received as parameter
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
     * @param ogpage
     * @param maxPrice
     * @param minPrice
     * @param languages
     * @return the list of courses that meet these criteria
     */
    List<Course> findCourses(String category, int max, int offset, String title, boolean freeOnly, boolean englishOnly, String sortBy, boolean sortByAsc, String difficulty,String ogpage,Float maxPrice,Float minPrice,List<String> languages){
        Course.createCriteria().list(max:max,offset:offset) {
            if(category) eq("category",category)
            if(title) ilike("title","%${title}%")
            if (freeOnly) or{
                eq("isFree",1)
                eq("isFree",2)
            }
            if(englishOnly) or{
                eq("language","English")
                eq("language","english")
            }
            if (languages) or{
                for (i in 0..<languages.size()) {
                    eq("language",languages[i])
                }
            }
            if(difficulty) eq("difficulty",difficulty)
            if(ogpage) eq("originalPage",ogpage)
            if(maxPrice != null && minPrice != null) between("price",minPrice,maxPrice)
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


    /**
     * Method that returns the list of courses whose id belongs to the list of ids received as parameter
     * @param ids
     * @return the list of requested courses
     */
    List<Course> getCourses(List<Long> ids) {
        List<Course> output = new LinkedList<>()
        ids?.forEach { Long id ->
            Course course = Course.get(id)
            if (course)
                output.add(course)
        }
        output
    }
}
