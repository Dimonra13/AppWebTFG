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
         if(cl){
             user.removeFromLists(cl)
             cl.delete()
         }
     }
}
