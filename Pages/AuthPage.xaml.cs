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

namespace PracticLatypov.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
            App.BtnControl(false);
        }

        private void EnterBtn_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginTb.Text.Trim();
            var User = App.db.Employee.Where(x => x.TabNumber.ToString() == login).FirstOrDefault();
            if(User != null)
            {
                if(User.IdPost == 1)
                {
                    MessageBox.Show($"Приветсвую вас {User.FullName} . Вы зашли как зав. кафедра");
                    App.BtnControl(true);
                    Navigation.NextPage(new PageComponent(new CafedraList(), "Кафедры"));
                }
                else if (User.IdPost == 2)
                {
                    MessageBox.Show($"Приветсвую вас {User.FullName} . Вы зашли как преподаватель");
                    App.BtnControl(true);
                    Navigation.NextPage(new PageComponent(new ExamList(), "Экзамены"));
                }
                else if (User.IdPost == 3)
                {
                    MessageBox.Show($"Приветсвую вас {User.FullName} . Вы зашли как инженер");
                    App.BtnControl(true);
                    Navigation.NextPage(new PageComponent(new EmployeeList(), "Сотрудники"));
                }
            }
            else
            {
                MessageBox.Show("Вы вошли как гость");
                
                Navigation.NextPage(new PageComponent(new DiciplineList(), "Дисциплина"));
                App.BtnControl(true);
            }
            
            
            
        }

        
    }
}
