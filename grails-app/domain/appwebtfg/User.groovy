package appwebtfg

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

import java.text.SimpleDateFormat

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String email
    String phoneNumber
    String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date())
    // Variable used to determine if other users are allowed to view this user's profile, by default its value is false
    boolean isPublicProfile
    boolean hasProfileImage
    byte[] profileImageBytes
    String profileImageContentType
    static hasMany = [lists: CourseList,
                      basicSkills: Skill,
                      mediumSkills: Skill,
                      expertSkills: Skill]
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        phoneNumber nullable: true, matches: /\d{9}/
        email matches: /.*@.*/
        profileImageBytes nullable: true
        profileImageContentType nullable: true
        basicSkills nullable: true, blank: true
        mediumSkills nullable: true, blank: true
        expertSkills nullable: true, blank: true
    }

    static mapping = {
	    password column: '`password`'
        profileImageBytes column: 'featured_image_bytes', sqlType: 'longblob'
        basicSkills joinTable: [name:"basic_skills"]
        mediumSkills joinTable: [name:"medium_skills"]
        expertSkills joinTable: [name:"expert_skills"]
    }
}
