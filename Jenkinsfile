pipeline {
    agent any
    
    environment {
        ROBOT_OPTIONS = "--outputdir results"  // Diretório onde os resultados dos testes serão salvos
    }

    stages {
        stage('Preparar Ambiente') {
            steps {
                echo "Instalando dependências..."
                 sh 'pip install robotframework==6.0.2'
                 sh 'pip install selenium==4.10.0'
                 sh 'pip install robotframework-seleniumlibrary==6.0.0'
                 sh 'pip install webdriver-manager'  // Para gerenciar os drivers do navegador
            }
        }
        
        stage('Executar Testes') {
            steps {
                echo "Executando teste com relatório HTML..."
                 sh "robot ${ROBOT_OPTIONS} -d results inspira_smoke.robot"  // Substitua "inspira_tests.robot" pelo nome do seu arquivo principal de testes
            }
        }
    }

    post {
        always {
            echo "Arquivando resultados dos testes..."
            archiveArtifacts artifacts: 'results/*.xml'
            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'results',
                reportFiles: 'report.html',
                reportName: 'Relatório do Robot Framework'
            ])
        }
        
        failure {
            echo "Alguns testes falharam."
        }
    }
}
