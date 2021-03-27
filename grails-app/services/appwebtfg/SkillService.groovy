package appwebtfg

import grails.gorm.transactions.Transactional

@Transactional
class SkillService {

    User updateSkills(User user, List<String> basicSkills, List<String> mediumSkills, List<String> expertSkills){
        updateBasicSkills(user, basicSkills)
        updateMediumSkills(user, mediumSkills)
        updateExpertSkills(user, expertSkills)
        user
    }

    User updateBasicSkills(User user, List<String> basicSkills) {
        Set<Skill> oldUserSkills = user?.basicSkills;
        Set<Skill> newUserSkills = new HashSet<>();
        for (String skillName: basicSkills){
            Skill skill = new Skill(name:skillName,level:"basic").save()
            newUserSkills.add(skill)
        }
        user.basicSkills = newUserSkills
        deleteSkills(oldUserSkills)
        user.save()
    }

    User updateMediumSkills(User user, List<String> mediumSkills) {
        Set<Skill> oldUserSkills = user?.mediumSkills;
        Set<Skill> newUserSkills = new HashSet<>();
        for (String skillName: mediumSkills){
            Skill skill = new Skill(name:skillName,level:"medium").save()
            newUserSkills.add(skill)
        }
        user.mediumSkills = newUserSkills
        deleteSkills(oldUserSkills)
        user.save()
    }

    User updateExpertSkills(User user, List<String> expertSkills) {
        Set<Skill> oldUserSkills = user?.expertSkills;
        Set<Skill> newUserSkills = new HashSet<>();
        for (String skillName: expertSkills){
            Skill skill = new Skill(name:skillName,level:"expert").save()
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
