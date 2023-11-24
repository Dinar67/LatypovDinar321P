using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using PracticLatypov.Components;
using PracticLatypov.Pages;

namespace PracticLatypov
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Navigation.mainWindow = this;
            Navigation.NextPage(new PageComponent(new AuthPage(), "Авторизация"));
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.BackPage();
            App.QrNext = true;
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent(new AuthPage(), "Авторизация"));
            App.QrNext = true;
        }

        private void QRBtn_Click(object sender, RoutedEventArgs e)
        {
            if (App.QrNext)
            {
                Navigation.NextPage(new PageComponent(new QrPage(), "Код"));
                App.QrNext = false;
            }
                
        }
    }
}
