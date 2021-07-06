package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseListService {

    /**
     * Method used to create a new courseList with name $name and description $description for the user $owner
     * @param owner
     * @param name
     * @param description
     * @return the new CourseList created cl
     */
    CourseList createCourseList(User owner, String name, String description) {
        if (!owner)
            return null
        CourseList cl = new CourseList(name: name, description: description, owner: owner)
        owner.addToLists(cl)
        owner.save()
        cl
    }

    /**
     * Method used to delete the courseList with id $id that belong to the user $user
     * @param user
     * @param id
     */
    void deleteCourseList(User user, Long id) {
        CourseList cl = CourseList.get(id)
        if (cl) {
            user.removeFromLists(cl)
            cl.delete()
        }
    }

    /**
     * Method used to edit the courseList with id $id
     * @param idList
     * @param title
     * @param description
     * @return the updated course list
     */
    CourseList editCourseList(Long idList, String title, String description){
        CourseList courseList = CourseList.get(idList)
        if (!courseList || !title || title=="")
            return null
        else{
            courseList?.name = title
            courseList?.description=description
            courseList?.save()
        }
    }

    /**
     * Method used to add the course with id $courseId to the courseList with id $courseListId
     * @param courseListId
     * @param courseId
     * @return the courseList with the course added or null in case of error
     */
    CourseList addCourseToList(Long courseListId, Long courseId) {
        CourseList cl = CourseList.get(courseListId)
        Course c = Course.get(courseId)
        if (cl && c && !cl?.courses?.any{it == c}) {
            cl.addToCourses(c)
            cl.save()
        } else {
            null
        }
    }

    /**
     * Method used to delete the course with id $courseId from the courseList with id $courseListId
     * @param courseListId
     * @param courseId
     * @return the courseList with the course deleted or null in case of error
     */
    CourseList deleteCourseFromList(Long courseListId, Long courseId) {
        CourseList cl = CourseList.get(courseListId)
        Course c = Course.get(courseId)
        if (cl && c) {
            cl.removeFromCourses(c)
            cl.save()
        } else {
            null
        }
    }
}
