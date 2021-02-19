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
            if (!registeredUser)
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

    @Unroll
    void "test the findUser method"(String username, String email, int size) {

        when: "There are three user registered in the database"
        String name = username ? username : "test"
        User.withNewSession {
            userService.makeProfilePublic(registrationService.registerUser(name + "1", "test", "test@gmail.com"))
            registrationService.registerUser(name + "2", "test", "test@gmail.com")
            userService.makeProfilePublic(registrationService.registerUser(name + "3", "test", "prueba@gmail.com"))
            userService.makeProfilePublic(registrationService.registerUser(name + "4", "test", "test@gmail.com"))
        }

        then: "The output list must have a size of three"
        userService.findUsers(username, email).size() == size

        cleanup:
        User.withNewSession { session ->
            for (int i = 1; i < 5; i++) {
                User registeredUser = User.findByUsername(name + "$i")
                UserRole.findByUser(registeredUser)?.delete()
                registeredUser?.delete()
            }

        }

        where:
        username | email    | size
        "test"   | "test"   | 2
        "test"   | null     | 3
        null     | "test"   | 2
        "test"   | "prueba" | 1
        null     | "prueba" | 1

    }

    @Unroll
    void "test the makeProfilePublic method"() {
        given: "A user with a private profile"
        User privateUser

        when: "The user is save in the database"
        privateUser = registrationService.registerUser("testPrivate", "testpass", "testPrivate@gmail.com")

        and: "The profile of the user is made public"
        privateUser = userService.makeProfilePublic(privateUser)

        then: "The profile of the user must be public"
        privateUser.isPublicProfile
    }

    @Unroll
    void "test the makeProfilePrivate method"() {
        given: "A user with a public profile"
        User publicUser

        when: "The user is save in the database"
        publicUser = registrationService.registerUser("testPublic", "testpass", "testPublic@gmail.com")

        and: "The profile of the user is made public"
        publicUser = userService.makeProfilePublic(publicUser)

        and: "The profile of the user is made private"
        publicUser = userService.makeProfilePrivate(publicUser)

        then: "The profile of the user must be private"
        !publicUser.isPublicProfile
    }

}
