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
        def testUser = new User(username: 'me', password: 'password', email: 'email@gmail.com').save()

        UserRole.create testUser, adminRole
        UserRole.create(testUser,userRole)
        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }

    def destroy = {
    }
}
