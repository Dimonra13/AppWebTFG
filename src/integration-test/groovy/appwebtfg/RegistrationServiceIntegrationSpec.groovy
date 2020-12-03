package appwebtfg

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import spock.lang.Specification
import spock.lang.Unroll

@Rollback
@Integration
class RegistrationServiceIntegrationSpec extends Specification {

    RegistrationService registrationService
    GeneralUtils generalUtils = new GeneralUtils()

    @Unroll
    void "test the registerUser method"(String username, String pass, String mail, boolean correct) {

        given: "The expected user and the test user"
        User testUser
        User expectedUser

        when: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The expected user is specified"
        expectedUser = correct ? new User(username: username, password: pass, email: mail) : null

        and: "A new user is registered in the database"
        testUser = registrationService.registerUser(username, pass, mail)

        then: "The output must be the same as the expected output of the method"
        expectedUser == testUser

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        username | pass   | mail             | correct
        "diego"  | "pass" | "mail@gmail.com" | true
        "diego"  | "pass" | "mailgamil.com"  | false
        "test"   | "pass" | "mail@gamil.com" | false


    }
}
