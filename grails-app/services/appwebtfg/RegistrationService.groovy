package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class RegistrationService {

    /**
     * Method used to created a new user
     * @param username
     * @param password
     * @param email
     * @return the new user created
     */
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

