import Quick
import Nimble

@testable import Bodyweight_Fitness

class DomainTests: QuickSpec {
    override func spec() {
        describe("Repository Routine Companion") {
            it("initializes") {
                let repositoryRoutine = RepositoryRoutine()
                let companion = RepositoryRoutineCompanion(repositoryRoutine)
                
                expect(companion.repositoryRoutine).to(equal(repositoryRoutine))
            }
        }
        
        describe("Repository Category Companion") {
            it("initializes") {
                let repositoryCategory = RepositoryCategory()
                let companion = RepositoryCategoryCompanion(repositoryCategory)

                expect(companion.repositoryCategory).to(equal(repositoryCategory))
            }
        }

        describe("Repository Exercise Companion") {
            context("isCompleted()") {
                it("is not completed when number of sets is 0") {
                    let repositoryExercise = RepositoryExercise()
                    let companion = RepositoryExerciseCompanion(repositoryExercise)
                    
                    expect(companion.isCompleted()).to(equal(false))
                }
                
                it("is not completed when first set is timed and time is set to 0") {
                    let repositorySet = RepositorySet()
                    repositorySet.isTimed = true
                    repositorySet.seconds = 0
                    
                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(repositorySet)
                    
                    let companion = RepositoryExerciseCompanion(repositoryExercise)
                    
                    expect(companion.isCompleted()).to(equal(false))
                }

                it("is not completed when multiple sets are timed and time is set to 0") {
                    let firstSet = RepositorySet()
                    firstSet.isTimed = true
                    firstSet.seconds = 0

                    let secondSet = RepositorySet()
                    secondSet.isTimed = true
                    secondSet.seconds = 0

                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(firstSet)
                    repositoryExercise.sets.append(secondSet)

                    let companion = RepositoryExerciseCompanion(repositoryExercise)

                    expect(companion.isCompleted()).to(equal(false))
                }

                it("is not completed when first set is weighted and repetitions are set to 0") {
                    let repositorySet = RepositorySet()
                    repositorySet.isTimed = false
                    repositorySet.reps = 0
                    
                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(repositorySet)
                    
                    let companion = RepositoryExerciseCompanion(repositoryExercise)
                    
                    expect(companion.isCompleted()).to(equal(false))
                }

                it("is not completed when multiple sets are weighted and repetitions are set to 0") {
                    let firstSet = RepositorySet()
                    firstSet.isTimed = false
                    firstSet.reps = 0

                    let secondSet = RepositorySet()
                    secondSet.isTimed = false
                    secondSet.reps = 0

                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(firstSet)
                    repositoryExercise.sets.append(secondSet)

                    let companion = RepositoryExerciseCompanion(repositoryExercise)

                    expect(companion.isCompleted()).to(equal(false))
                }
                
                it("is completed when first set is timed and time is bigger than 0") {
                    let repositorySet = RepositorySet()
                    repositorySet.isTimed = true
                    repositorySet.seconds = 10
                    
                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(repositorySet)
                    
                    let companion = RepositoryExerciseCompanion(repositoryExercise)
                    
                    expect(companion.isCompleted()).to(equal(true))
                }

                it("is completed when first set is weighted and repetitions are bigger than 0") {
                    let repositorySet = RepositorySet()
                    repositorySet.isTimed = false
                    repositorySet.reps = 1

                    let repositoryExercise = RepositoryExercise()
                    repositoryExercise.sets.append(repositorySet)

                    let companion = RepositoryExerciseCompanion(repositoryExercise)

                    expect(companion.isCompleted()).to(equal(true))
                }
            }
        }
    }
}