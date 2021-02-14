package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class CourseListService {

    CourseList createCourseList(User owner, String name, String description) {
        CourseList cl = new CourseList(name: name, description: description, owner: owner)
        owner.addToLists(cl)
        owner.save()
        cl
    }

    void deleteCourseList(User user, Long id) {
        CourseList cl = CourseList.get(id)
        if (cl) {
            user.removeFromLists(cl)
            cl.delete()
        }
    }

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
