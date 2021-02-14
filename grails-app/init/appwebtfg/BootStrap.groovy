package appwebtfg

import grails.gorm.transactions.Transactional

class BootStrap {

    def init = { servletContext ->
        addTestUser()
    }

    @Transactional
    void addTestUser() {
        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()
        def testUser = new User(username: 'me', password: 'password', email: 'email@gmail.com')
        CourseList cl1 = new CourseList(name: "To Do", owner: testUser)
        testUser.addToLists(cl1)
        testUser.save()

        UserRole.create testUser, adminRole
        UserRole.create(testUser,userRole)
        UserRole.withSession {
            it.flush()
            it.clear()
        }

        Course c1 = new Course(name: "testCourse").save()
        Course c2 = new Course(name: "nombre", avgscore: 3.4, studentNumber: 12345, description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgthytjuryikjdhtsgvfdascaxnhtmjyk,tu,kgumfjhgdnfsbdvfscdk,umfjyhgdnfbvdfc").save()
        Course c3 = new Course(name: "nombre", studentNumber: 12345, description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgt").save()
        cl1.addToCourses(c1)
        cl1.addToCourses(c2)
        cl1.addToCourses(c3)
        cl1.save()
    }

    def destroy = {
    }
}
