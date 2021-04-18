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
    List<String> interests
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

    /**
     * Method use to create a string with all user's basic level skills and returns it
     * @return String with the basic level skills
     */
    String basicSkillsToString(){
        if (!basicSkills.isEmpty()){
            String out=basicSkills[0].name
            for (int i=1;i<basicSkills.size();i++){
                out=out+","+basicSkills[i].name
            }
            out
        }else{
            ""
        }
    }

    /**
     * Method use to create a string with all user's medium level skills and returns it
     * @return String with the medium level skills
     */
    String mediumSkillsToString(){
        if (!mediumSkills.isEmpty()){
            String out=mediumSkills[0].name
            for (int i=1;i<mediumSkills.size();i++){
                out=out+","+mediumSkills[i].name
            }
            out
        }else{
            ""
        }
    }

    /**
     * Method use to create a string with all user's expert level skills and returns it
     * @return String with the expert level skills
     */
    String expertSkillsToString(){
        if (!expertSkills.isEmpty()){
            String out=expertSkills[0].name
            for (int i=1;i<expertSkills.size();i++){
                out=out+","+expertSkills[i].name
            }
            out
        }else{
            ""
        }
    }
}
