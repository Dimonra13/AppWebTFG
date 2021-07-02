package appwebtfg

import com.opencsv.CSVReader
import grails.gorm.transactions.Transactional
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if(Environment.current != Environment.TEST){
            if(!Course.get(100)){
                if(Environment.current == Environment.DEVELOPMENT)
                    addTestUser()
                readCsvCoursera()
                readCsvUdacity()
                readCsvUdemy()
            }
        }
    }

    @Transactional
    void readCsvCoursera(){
        try {
            String path
            if(Environment.current == Environment.DEVELOPMENT)
                path = "./grails-app/assets/data/cleaned_coursera.csv"
            else
                path = "./cleaned_coursera.csv"
            CSVReader reader = new CSVReader(new FileReader(path))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.eachWithIndex{ String[] line, int index ->
                Course course = new Course(title: line[14], description: line[1],url: line[15],
                        category: mapCourseraCategory(line[17]),idCurso: index,language: line[9],author: line[7],
                        rating: Float.parseFloat(line[11]),difficulty: line[2],isFree: 2,duration: Float.parseFloat(line[20]),price: 0,
                        popularity: Float.parseFloat(line[5]).intValue(),originalPage: "Coursera")
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
            case { it == "Support and Operations" || it == "Software Development" || it == "Mobile and Web Development"}:
                return "Software-Engineering"
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
            case "Design and Product":
                return "Graphic-Design"
            default:
                return null
        }
    }

    @Transactional
    void readCsvUdacity(){
        try {
            String path
            if(Environment.current == Environment.DEVELOPMENT)
                path = "./grails-app/assets/data/cleaned_udacity.csv"
            else
                path = "./cleaned_udacity.csv"
            CSVReader reader = new CSVReader(new FileReader(path))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.findAll {tokens -> tokens.size() == 14}.eachWithIndex{ String[] line, int index ->
                 Course course = new Course(title: line[10], description: line[1],url: line[11],
                         category: mapUdacityCategory(line[8]),idCurso: index,language: line[12],
                         author: line[0],rating: Math.round((Float.parseFloat(line[7])/20) * 100)/ 100,difficulty: line[2],
                         isFree: (line[4]=="1") ? 1 : 3, duration: Float.parseFloat(line[3]),price: (line[4]=="1") ? 0 : 359,
                         popularity: Float.parseFloat(line[6]).intValue(),originalPage: "Udacity")
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
    void readCsvUdemy(){
        try {
            String path
            if(Environment.current == Environment.DEVELOPMENT)
                path = "./grails-app/assets/data/cleaned_udemy.csv"
            else
                path = "./cleaned_udemy.csv"
            CSVReader reader = new CSVReader(new FileReader(path))
            List<String[]> r = reader.readAll()
            r.remove(0)
            r.eachWithIndex{ String[] line, int index ->
                    try{
                        Course course = new Course(title: line[11], description: line[2],url: line[12],
                                category: mapUdemyCategory(line[10]),idCurso: index,language: line[6],
                                rating: Float.parseFloat(line[8]),popularity: Float.parseFloat(line[7]).intValue(), originalPage: "Udemy",
                                isFree: line[4], duration: Math.round(Float.parseFloat(line[13]) * 100) / 100,price: Float.parseFloat(line[1]))
                        if(course)
                            course.save()
                    }catch(Exception e){
                        println "Curso "+index+":"
                        e.printStackTrace()
                    }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace()
        } catch (IOException e) {
            e.printStackTrace()
        }
    }

    String mapUdemyCategory(String ogCategory){
        switch (ogCategory){
            case { it == "Interior Design" || it == "Home Improvement" || it == "Architectural Design" }:
                return "Architecture"
            case "IT Certification":
                return "IT-Certification"
            case { it == "Memory & Study Skills" || it == "Test Prep"}:
                return "Test-Prep"
            case { it == "Gaming" | it == "Game Design" || it == "Game Development" }:
                return "Gaming"
            case "Data Science":
                return "Data-Science"
            case { it == "Engineering" || it == "Hardware" || it == "Industry"}:
                return "Engineering"
            case { it == "Development Tools" || it == "Mobile Development" || it == "Database Design & Development" || it == "No-Code Development" || it == "Operating Systems" || it == "Programming Languages" || it == "Software Engineering" || it == "Software Testing" || it == "Web Development"}:
                return "Software-Engineering"
            case { it == "E-Commerce" || it == "Finance Cert & Exam Prep" || it == "Economics" || it == "Finance" || it == "Financial Modeling & Analysis" || it == "Investing & Trading" || it == "Money Management Tools" || it == "Operations" || it == "Real Estate" || it == "Taxes"}:
                return "Business-Finance"
            case { it == "Network & Security" || it == "Security" }:
                return "Security"
            case { it == "Leadership" || it == "Media" || it == "Project Management" }:
                return "Leadership"
            case  { it == "Design Thinking" || it == "Management" || it == "Human Resources" || it == "Entrepreneurship" || it == "Influence"} :
                return "Entrepreneurship"
            case { it == "Personal Brand Building" || it == "Personal Productivity" || it == "Personal Transformation" } :
                return "Personal-Development"
            case { it == "Language" || it == "Humanities" || it == "Public Relations" || it == "Social Science"}:
                return "Human-Studies"
            case { it == "Online Education" || it == "Teacher Training" }:
                return "Education"
            case { it == "Fashion Design" || it == "Instruments" || it == "Music Production" || it == "Music Techniques" || it == "Music Fundamentals" || it == "Music Software" || it == "Vocal"}:
                return "Arts"
            case "Math":
                return "Maths"
            case { it == "Fitness" || it == "Meditation" || it == "Mental Health" || it == "Motivation" || it == "Nutrition" || it == "Dieting" || it == "Food & Beverage" || it == "General Health" || it == "Happiness" || it == "Parenting & Relationships" || it == "Pet Care & Training" || it == "Religion & Spirituality" || it == "Self Defense" || it == "Self Esteem & Confidence" || it == "Sports" || it == "Stress Management" || it == "Safety & First Aid" || it == "Travel" || it == "Yoga"}:
                return "Health"
            case "Science":
                return "Science"
            case { it == "Digital Marketing" || it == "Growth Hacking" || it == "Marketing Analytics & Automation" || it == "Marketing Fundamentals" || it == "Product Marketing" || it == "Sales" || it == "Search Engine Optimization" || it == "Social Media Marketing" || it == "Video & Mobile Marketing"} :
                return "Marketing"
            case { it == "Design Tools" || it == "Digital Photography" || it == "Graphic Design & Illustration" || it == "Photography" || it == "Photography Tools" || it == "Portrait Photography" || it == "User Experience Design" || it == "Video Design" || it == "Web Design"}:
                return "Graphic-Design"
            case "Google":
                return "Google"
            case "Apple":
                return "Apple"
            case "Oracle":
                return "Oracle"
            case "Microsoft":
                return "Microsoft"
            case "SAP":
                return "SAP"
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

         new User(username: "me1", password: 'password', email: 'email@gmail.com',isPublicProfile: true).save()
         new User(username: "me2", password: 'password', email: 'email@gmail.com',isPublicProfile: true).save()

         Course c1 = new Course(title: "testCourse",category: "Software-Engineering").save()
         Course c2 = new Course(title: "nombre",category: "Software-Engineering", rating: 3.4, description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgthytjuryikjdhtsgvfdascaxnhtmjyk,tu,kgumfjhgdnfsbdvfscdk,umfjyhgdnfbvdfc").save()
         Course c3 = new Course(title: "nombre",category: "Software-Engineering", description: "sdvfgbahnsjmkmdjhnsfgbdvscdfvgt").save()
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
