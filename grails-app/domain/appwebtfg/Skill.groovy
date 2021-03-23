package appwebtfg

import groovy.transform.EqualsAndHashCode

@EqualsAndHashCode(includes='name')
class Skill {
    String name
    String level
    static constraints = {
        name nullable: false, blank: false
        level matches: /basic||medium||expert/
    }
}
