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

        and: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The expected user is specified"
        expectedUser = correct ? new User(username: username, password: pass, email: mail) : null

        when: "The user information is updated"
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

        given: "There are three user registered in the database"
        String name = username ? username : "test"
        User.withNewSession {
            userService.makeProfilePublic(registrationService.registerUser(name + "1", "test", "test@gmail.com"))
            registrationService.registerUser(name + "2", "test", "test@gmail.com")
            userService.makeProfilePublic(registrationService.registerUser(name + "3", "test", "prueba@gmail.com"))
            userService.makeProfilePublic(registrationService.registerUser(name + "4", "test", "test@gmail.com"))
        }

        when: "FindUser method is called"
        List<User> output = userService.findUsers(username, email)

        then: "The output list must have the specified output"
        output.size() == size

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
        "test"   | "test"   | 3
        "test"   | null     | 3
        null     | "test"   | 2
        "test"   | "prueba" | 3
        null     | "prueba" | 1

    }

    @Unroll
    void "test the findUser paginated method"(String username, String email, int size) {

        given: "There are 12 user registered in the database"
        User.withNewSession {
            for (int i = 1; i < 12; i++) {
                userService.makeProfilePublic(registrationService.registerUser("test" + i, "test", "test@gmail.com"))
            }
        }

        when: "FindUser method is called"
        List<User> output = userService.findUsers(username, email, 10, 0)

        then: "The output list must have the specified output"
        output.size() == size

        cleanup:
        User.withNewSession { session ->
            for (int i = 1; i < 12; i++) {
                User registeredUser = User.findByUsername("test" + "$i")
                UserRole.findByUser(registeredUser)?.delete()
                registeredUser?.delete()
            }

        }

        where:
        username | email  | size
        "test"   | "test" | 10
        "test"   | null   | 10
        "test1"  | null   | 3
        "test11" | null   | 1

    }

    @Unroll
    void "test the makeProfilePublic method"() {
        given: "A user with a private profile"
        User privateUser

        and: "The user is save in the database"
        privateUser = registrationService.registerUser("testPrivate", "testpass", "testPrivate@gmail.com")

        when: "The profile of the user is made public"
        privateUser = userService.makeProfilePublic(privateUser)

        then: "The profile of the user must be public"
        privateUser.isPublicProfile
    }

    @Unroll
    void "test the makeProfilePrivate method"() {
        given: "A user with a public profile"
        User publicUser

        and: "The user is save in the database"
        publicUser = registrationService.registerUser("testPublic", "testpass", "testPublic@gmail.com")

        and: "The profile of the user is made public"
        publicUser = userService.makeProfilePublic(publicUser)

        when: "The profile of the user is made private"
        publicUser = userService.makeProfilePrivate(publicUser)

        then: "The profile of the user must be private"
        !publicUser.isPublicProfile
    }

    @Unroll
    void "test the updateInterests method"(List<String> userNewInterests) {

        given: "The expected interests list and the test user"
        User testUser
        List<String> expectedInterestList

        and: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            testUser = registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The expected interests list is specified"
        expectedInterestList = userNewInterests ?: []

        when: "User's interests list is updated"
        testUser = userService.updateInterests(testUser, userNewInterests)

        then: "The test user's interests list must be updated correctly"
        expectedInterestList == testUser.interests

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        userNewInterests           | _
        null                       | _
        []                         | _
        ["test"]                   | _
        ["test", "test2", "test3"] | _

    }

    @Unroll
    void "test the updatePreferences method"(Float duration, Float cost, Float popularity, Float difficulty) {

        given: "The expected user course preferences and the test user"
        User testUser
        //Expected course preferences
        Float expectedDuration
        Float expectedCost
        Float expectedPopularity
        Float expectedDifficulty

        and: "There is one user registered in the database"
        if (!User.findByUsername("test"))
            testUser = registrationService.registerUser("test", "test", "test@gmail.com")

        and: "The expected preferences are specified"
        expectedDuration = duration
        expectedCost = cost
        expectedPopularity = popularity
        expectedDifficulty = difficulty

        when: "User's preferences are updated"
        testUser = userService.updatePreferences(testUser, duration, cost, popularity, difficulty)

        then: "The test user's preferences must be updated correctly"
        (expectedDuration == testUser.duration) && (expectedCost == testUser.cost) &&
                (expectedPopularity == testUser.popularity) && (expectedDifficulty == testUser.difficulty)

        cleanup:
        User.withNewSession { session ->
            User registeredUser = User.findByUsername("test")
            UserRole.findByUser(registeredUser)?.delete()
            registeredUser?.delete()
        }

        where:
        duration | cost | popularity | difficulty
        null     | null | null       | null
        1        | 2    | null       | null
        1        | 2    | 3          | 4
        1.23     | 1.3  | 2.456      | 4.5
        1        | null | 3.56       | null

    }
}
