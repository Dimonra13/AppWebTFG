package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class SkillService {

    /**
     * Method that returns the most popular basic level skills (max 20)
     * @return List<String> that contains the skills
     */
    List<String> getRecommendedBasicSkills(){
        def out = Skill.createCriteria().list(max: 20,offset: 0) {
            projections {
                groupProperty("name")
                count("name", 'myCount')
            }
            eq'level','basic'
            order 'myCount', 'desc'
        }.collect{it[0]}
        out
    }

    /**
     * Method that returns the most popular medium level skills (max 20)
     * @return List<String> that contains the skills
     */
    List<String> getRecommendedMediumSkills(){
        def out = Skill.createCriteria().list(max: 20,offset: 0) {
            projections {
                groupProperty("name")
                count("name", 'myCount')
            }
            eq'level','medium'
            order 'myCount', 'desc'
        }.collect{it[0]}
        out
    }

    /**
     * Method that returns the most popular expert level skills (max 20)
     * @return List<String> that contains the skills
     */
    List<String> getRecommendedExpertSkills(){
        def out = Skill.createCriteria().list(max: 20,offset: 0) {
            projections {
                groupProperty("name")
                count("name", 'myCount')
            }
            eq'level','expert'
            order 'myCount', 'desc'
        }.collect{it[0]}
        out
    }

    /**
     * Method that updates all of the user's skills lists
     * @param user
     * @param basicSkills
     * @param mediumSkills
     * @param expertSkills
     * @return user with the updated skills lists
     */
    User updateSkills(User user, List<String> basicSkills, List<String> mediumSkills, List<String> expertSkills){
        updateBasicSkills(user, basicSkills)
        updateMediumSkills(user, mediumSkills)
        updateExpertSkills(user, expertSkills)
        user
    }

    /**
     * Method that updates the user's basic skills list
     * @param user
     * @param basicSkills
     * @return user with the basic skills list updated
     */
    User updateBasicSkills(User user, List<String> basicSkills) {
        Set<Skill> oldUserSkills = user?.basicSkills
        Set<Skill> newUserSkills = new HashSet<>()
        for (String skillName: basicSkills){
            Skill skill = new Skill(name:skillName,level:"basic").save()
            if(skill)
                newUserSkills.add(skill)
        }
        user.basicSkills = newUserSkills
        deleteSkills(oldUserSkills)
        user.save()
    }

    /**
     * Method that updates the user's medium skills list
     * @param user
     * @param mediumSkills
     * @return user with the medium skills list updated
     */
    User updateMediumSkills(User user, List<String> mediumSkills) {
        Set<Skill> oldUserSkills = user?.mediumSkills
        Set<Skill> newUserSkills = new HashSet<>()
        for (String skillName: mediumSkills){
            Skill skill = new Skill(name:skillName,level:"medium").save()
            if(skill)
                newUserSkills.add(skill)
        }
        user.mediumSkills = newUserSkills
        deleteSkills(oldUserSkills)
        user.save()
    }

    /**
     * Method that updates the user's expert skills list
     * @param user
     * @param expertSkills
     * @return user with the expert skills list updated
     */
    User updateExpertSkills(User user, List<String> expertSkills) {
        Set<Skill> oldUserSkills = user?.expertSkills
        Set<Skill> newUserSkills = new HashSet<>()
        for (String skillName: expertSkills){
            Skill skill = new Skill(name:skillName,level:"expert").save()
            if(skill)
                newUserSkills.add(skill)
        }
        user.expertSkills = newUserSkills
        deleteSkills(oldUserSkills)
        user.save()
    }

    private def deleteSkills(Set<Skill> skills){
        while(skills && !skills.isEmpty()){
            Skill skill = skills.getAt(0)
            skills.remove(skill)
            skill.delete()
        }
    }
}
