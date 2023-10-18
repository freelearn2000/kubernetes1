echo "Building the Project : %date% %time%"
cd ./Frontend
npm ci && npm run build && Xcopy .\build ..\Backend\build /E /I /Y
