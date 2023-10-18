echo "Building the Project : %date% %time%"
cd ./Frontend
npm ci && npm run build
'''xcopy /s /e /i /h /y "./Frontend/build" "./Backend"''';
