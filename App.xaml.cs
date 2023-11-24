using PracticLatypov.Components;
using PracticLatypov.Pages;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace PracticLatypov
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : System.Windows.Application
    {
        public static BaseForPracticEntities1 db = new BaseForPracticEntities1();
        public static Employee user = new Employee();
        public static bool CanBack = true;
        public static AddEditExamPage ExamPage;
        public static AddEditCafedraPage CafedraPage;
        public static bool QrNext = true;

        public static void BtnControl(bool a)
        {
            if (a)
            {
                Navigation.mainWindow.ExitBtn.Visibility = Visibility.Visible;
                Navigation.mainWindow.BackBtn.Visibility = Visibility.Visible;
            }
            else
            {
                Navigation.mainWindow.ExitBtn.Visibility = Visibility.Collapsed;
                Navigation.mainWindow.BackBtn.Visibility = Visibility.Collapsed;
            }
        }
    }
}

