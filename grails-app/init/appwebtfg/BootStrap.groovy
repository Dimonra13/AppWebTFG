package appwebtfg

import com.opencsv.CSVReader
import grails.gorm.transactions.Transactional

class BootStrap {

    def init = { servletContext ->
        addTestUser()
        if(!Course.get(100)){
            readCsvCoursera()
            readCsvUdacity()
        }

    }

    @Transactional
    void readCsvCoursera(){
        try {
            CSVReader reader = new CSVReader(new FileReader("./grails-app/init/appwebtfg/cleaned_coursera.csv"))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.eachWithIndex{ String[] line, int index ->
                Course course = new Course(title: line[14], description: line[1],url: line[15],
                        category: mapCourseraCategory(line[17]),idCurso: index,language: line[9],author: line[7],
                        rating: Float.parseFloat(line[11]),difficulty: line[2],isFree: 2)
                if(course)
                    course.save()
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace()
        } catch (IOException e) {
            e.printStackTrace()
        }
    }

    String mapCourseraCategory(String ogCategory) {
        switch (ogCategory){
            case { it == "Data Analysis" || it == "Data Management" }:
                return "Data-Science"
            case "Machine Learning" :
                return "Machine-Learning"
            case "Cloud Computing" :
                return "Cloud-Computing"
            case { it == "Electrical Engineering" || it == "Mechanical Engineering" }:
                return "Engineering"
            case { it == "Business Essentials" || it == "Business Strategy" || it == "Finance" || it == "Economics" }:
                return "Business-Finance"
            case { it == "Computer Security and Networks" || it == "Security" }:
                return "Security"
            case { it == "Leadership and Management" || it == "Networking" }:
                return "Leadership"
            case "Entrepreneurship" :
                return "Entrepreneurship"
            case "Personal Development" :
                return "Personal-Development"
            case { it == "Other Languages" || it == "Psychology" || it == "Law" || it == "Philosophy" ||
                    it =="Learning English" || it == "History" || it == "Governance and Society" }:
                return "Human-Studies"
            case "Education":
                return "Education"
            case "Music and Art" :
                return "Arts"
            case { it == "Math and Logic" || it == "Algorithms" || it == "Probability and Statistics" }:
                return "Maths"
            case { it == "Health Informatics" || it == "Healthcare Management" || it == "Patient Care" ||
                    it == "Public Health" || it == "Nutrition" || it == "Animal Health" }:
                return "Health"
            case { it == "Chemistry" || it == "Research Methods" || it == "Research" || it == "Biology" ||
                    it == "Environmental Science and Sustainability" || it == "Basic Science" ||
                     it == "Physics and Astronomy" }:
                return "Science"
            case "Marketing" :
                return "Marketing"
            default:
                return null
        }
    }

    @Transactional
    void readCsvUdacity(){
        try {
            CSVReader reader = new CSVReader(new FileReader("./grails-app/init/appwebtfg/cleaned_udacity.csv"))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.findAll {tokens -> tokens.size() == 14}.eachWithIndex{ String[] line, int index ->
                 Course course = new Course(title: line[10], description: line[1],url: line[11],
                         category: mapUdacityCategory(line[8]),idCurso: index,language: line[12],
                         author: line[0],rating: Float.parseFloat(line[7])/20,difficulty: line[2],isFree: 3)
                 if(course)
                     course.save()
             }
         } catch (FileNotFoundException e) {
             e.printStackTrace()
         } catch (IOException e) {
             e.printStackTrace()
         }
     }

    String mapUdacityCategory(String ogCategory) {
        switch (ogCategory){
            case "School of Data Science" :
                return "Data-Science"
            case "School of Cloud Computing" :
                return "Cloud-Computing"
            case "School of Artificial Intelligence" :
                return "Machine-Learning"
            case "School of Business" :
                return "Business-Finance"
            case "Career Advancement" :
                return "Personal-Development"
            case "School of Programming & Development":
                return "Software-Engineering"
            case "School of Autonomous Systems" :
                return "Software-Engineering"
            default:
                return null
        }
    }
     @Transactional
     void addTestUser() {
         def adminRole = new Role(authority: 'ROLE_ADMIN').save()
         def userRole = new Role(authority: 'ROLE_USER').save()
         def testUser = new User(username: 'me', password: 'password', email: 'email@gmail.com')
         CourseList cl1 = new CourseList(name: "To Do", owner: testUser)
         testUser.addToLists(cl1)
         testUser.save()

         UserRole.create testUser, adminRole
         UserRole.create(testUser,userRole)
         UserRole.withSession {
             it.flush()
             it.clear()
         }

         Course c1 = new Course(title: "testCourse").save()
         Course c2 = new Course(title: "nombre", rating: 3.4, description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgthytjuryikjdhtsgvfdascaxnhtmjyk,tu,kgumfjhgdnfsbdvfscdk,umfjyhgdnfbvdfc").save()
         Course c3 = new Course(title: "nombre", description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgt").save()
         cl1.addToCourses(c1)
         cl1.addToCourses(c2)
         cl1.addToCourses(c3)
         cl1.save()

         //Basic Skills
         for(int i=0;i<10;i++)
             new Skill(name:"JS",level: "basic").save()
         for(int i=0;i<7;i++)
             new Skill(name:"C++",level: "basic").save()
         for(int i=0;i<5;i++)
             new Skill(name:"SQL",level: "basic").save()
         for(int i=0;i<20;i++)
             new Skill(name:"Gradle",level: "basic").save()
         for(int i=0;i<1;i++)
             new Skill(name:"Maven",level: "basic").save()

         //Medium Skills
         for(int i=0;i<10;i++)
             new Skill(name:"Java",level: "medium").save()
         for(int i=0;i<7;i++)
             new Skill(name:"C#",level: "medium").save()
         for(int i=0;i<5;i++)
             new Skill(name:"Python",level: "medium").save()

         //Medium Skills
         for(int i=0;i<10;i++)
             new Skill(name:"Grails",level: "expert").save()
         for(int i=0;i<7;i++)
             new Skill(name:"HTML5",level: "expert").save()
         for(int i=0;i<5;i++)
             new Skill(name:"Angular",level: "expert").save()

     }

     def destroy = {
     }

 }
