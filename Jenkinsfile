pipeline {
  agent {
    label '10.249.21.98'
  }
  stages {
    stage('Connect git') {
      steps {
        sh 'echo "Hello " `logname`'
      }
    }

    stage('Clone Repo') {
      steps {
        sh 'cp /opt/sas/devops/workspace/SASTable/* /bkp/.'
        echo 'Clone Git Repository'
      }
    }

    stage('Load Tables') {
      parallel {
        stage('Load Tables') {
          steps {
            sh '/opt/sas/spre/home/SASFoundation/sas -autoexec "/opt/sas/viya/config/etc/workspaceserver/default/autoexec_deployment.sas" /opt/sas/devops/workspace/SASTable/sasprogramjenkins.sas -log /tmp/CAS.log'
            echo 'Loaded tables to memory'
          }
        }

        stage('Test Files') {
          steps {
            sh '''/opt/sas/spre/home/SASFoundation/sas -autoexec "/opt/sas/viya/config/etc/workspaceserver/default/autoexec_deployment.sas" /opt/sas/devops/workspace/B3_master/Test.sas
'''
            echo 'Test List'
          }
        }

        stage('Test Tables') {
          steps {
            sh '''/opt/sas/spre/home/SASFoundation/sas -autoexec "/opt/sas/viya/config/etc/workspaceserver/default/autoexec_deployment.sas" /opt/sas/devops/workspace/B3_master/TestTables.sas
'''
            echo 'Tables Listed'
          }
        }

      }
    }

    stage('Deployment') {
      steps {
        sh '/opt/sas/spre/home/SASFoundation/sas -autoexec "/opt/sas/viya/config/etc/workspaceserver/default/autoexec_deployment.sas" /opt/sas/devops/workspace/SASTable/DataPreparation.sas -log /tmp/CAS.log'
        echo 'Preparated Data'
        echo 'Deployment Successful'
      }
    }

    stage('Artifact Saved') {
      steps {
        sh '/opt/sas/spre/home/SASFoundation/sas -autoexec "/opt/sas/viya/config/etc/workspaceserver/default/autoexec_deployment.sas" /opt/sas/devops/workspace/SASTable/Scoring.sas -log /tmp/CAS.log'
        echo 'Scored Successful'
      }
    }

  }
  post {
    always {
      echo 'Job Done!'
    }

  }
}