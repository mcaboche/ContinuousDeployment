pipeline{
    agent {
        label 'master'
    }
  stages{
    stage ('Checkout'){
      when {
       expression {
           return env.BRANCH_NAME != 'master' || env.CHANGE_ID != '';
       }
      }
      steps{
        checkout scm
      }
    }
    stage ('Install node modules'){
      when {
       expression {
           return env.BRANCH_NAME != 'master' || env.CHANGE_ID != '';
       }
      }
      steps{
        sh '''
          npm install --verbose -d
        '''
      }
    }
    stage ('Test'){
      when {
       expression {
           return env.BRANCH_NAME != 'master' || env.CHANGE_ID != '';
       }
      }
      steps{
        sh '''
          npm test
        '''
      }
      post {
          always {
            junit "test-results.xml"
          }
      }
    }
    stage ('Build') {
      when {
       expression {
           return env.BRANCH_NAME != 'master' || env.CHANGE_ID != '';
       }
      }
      steps{
        sh 'npm run-script build'
      }
    }

    stage ('Deployment') {
      when {
       expression {
           return env.BRANCH_NAME != 'master' || env.CHANGE_ID != '';
       }
      }
      steps{
        sh ("chmod +x ./deployment.sh")
        sh ('./deployment.sh ' + env.BRANCH_NAME)
      }
    }
  }
}
