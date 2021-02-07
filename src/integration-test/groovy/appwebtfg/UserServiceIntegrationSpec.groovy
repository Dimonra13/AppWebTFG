package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class UserServiceIntegrationSpec extends Specification {

    RegistrationService registrationService
    UserService userService
    GeneralUtils generalUtils = new GeneralUtils()

    @Unroll
    void "test the updateUser method"(String username, String pass, String mail, boolean passchanged, boolean correct) {

        given: "The expected user and the test user"
        User testUser
        User expectedUser

        when: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The expected user is specified"
        expectedUser = correct ? new User(username: username, password: pass, email: mail) : null

        and: "The user information is updated"
        testUser = userService.updateUser(new User(username: username, password: pass, email: mail), User.findByUsername("test"), passchanged)

        then: "The output must be the same as the expected output of the method"
        expectedUser == testUser

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            if(!registeredUser)
                registeredUser = User.findByUsername(username)
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        username | pass       | mail             | passchanged | correct
        "test"   | null       | "mail@gmail.com" | false       | true
        "test"   | "testpass" | "mail@gmail.com" | true        | true
        "diego"  | null       | "mail@gmail.com" | false       | true
        "diego"  | null       | "mailgamil.com"  | false       | false
        "diego"  | "pass"     | "mailgamil.com"  | true        | false

    }
}
