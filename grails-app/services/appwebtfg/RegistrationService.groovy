package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class RegistrationService {

    User registerUser(String username,String password, String email) {
        User user = new User([username: username, password: password, email: email]).save()
        Role role = Role.findByAuthority('ROLE_USER')
        UserRole.create(user,role)
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        user
    }

}

