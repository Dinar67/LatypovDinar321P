using System;
using System.Collections.Generic;
using System.Data;
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
using PracticLatypov.Windows;

namespace PracticLatypov.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditExamPage.xaml
    /// </summary>
    public partial class AddEditEmployeePage : Page
    {
        private Employee employee;
        private bool New;
        public AddEditEmployeePage(Employee _employee)
        {
            InitializeComponent();
            employee = _employee;
            this.DataContext = employee;
            NameCafedraCb.ItemsSource = App.db.Cafedra.ToList();
            NamePostCb.ItemsSource = App.db.Post.ToList();
            ShefCb.ItemsSource = App.db.Employee.ToList();
            NameTitleCb.ItemsSource = App.db.Title.ToList();
            EnginerSpecialityCb.ItemsSource = App.db.EnginerSpeciality.ToList();
            if (employee.TabNumber == 0)
            {
                New = true; 
                TabNumberTb.IsEnabled = true;
            }
            else
            {
                New = false;
                TabNumberTb.IsEnabled = false;
            }

            PostSelect();
        }
        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!IsNumber(TabNumberTb.Text) || TabNumberTb.Text == "")
            {
                MessageBox.Show("Табельный номер должен содержать только цифры и не должен быть пустым");
                return;
            }
            else if (FullNameTb.Text == "")
            {
                MessageBox.Show("У сотрудника должна быть фамилия");
                return;
            }
            else if (NamePostCb.SelectedItem == null)
            {
                MessageBox.Show("У сотрудника должна быть выбрана должность");
                return;
            }
            else if (OkladTb.Text == "" || !IsNumber(OkladTb.Text))
            {
                MessageBox.Show("Оклад должен содержать только цифры и не должен быть пустым");
                return;
            }
            else if (!IsNumber(ExpirienceTb.Text))
            {
                MessageBox.Show("Стаж должен содержать только цифры");
                return;
            }
            else
            {
                if(NameCafedraCb.SelectedItem != null)
                    employee.Shifr = (NameCafedraCb.SelectedItem as Cafedra).Shifr;
                employee.IdPost = (NamePostCb.SelectedItem as Post).IdPost;
                if (ShefCb.SelectedItem != null)
                    employee.Shef = (ShefCb.SelectedItem as Employee).TabNumber;
                if (NameTitleCb.SelectedItem != null)
                    employee.IdTitle = (NameTitleCb.SelectedItem as Title).IdTitle;
                if (EnginerSpecialityCb.SelectedItem != null)
                    employee.idEnginerSpeciality = (EnginerSpecialityCb.SelectedItem as EnginerSpeciality).idEnginerSpeciality;
                if (New)
                {
                    if (App.db.Employee.Any(x => x.TabNumber.ToString() == TabNumberTb.Text))
                    {
                        MessageBox.Show("Сотрудник с таким регистрационным номером уже есть");
                        return;
                    }
                    else
                        App.db.Employee.Add(employee);
                }
                    
                App.db.SaveChanges();
                Navigation.NextPage(new PageComponent(new EmployeeList(), "Сотрудники"));
            }
        }
        private bool IsNumber(string text)
        {
            foreach (char a in text)
            {
                if (Char.IsDigit(a) == false)
                    return false;
            }
            return true;
        }
        private void NamePostCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            PostSelect();
        }
        private void PostSelect()
        {
            Post post = NamePostCb.SelectedItem as Post;
            if (post != null)
            {
                if (post.IdPost == 1)
                    ExpirienceSp.Visibility = Visibility.Visible;
                else
                    ExpirienceSp.Visibility = Visibility.Collapsed;

                if (post.IdPost == 2)
                    NameTitleSp.Visibility = Visibility.Visible;
                else
                    NameTitleSp.Visibility = Visibility.Collapsed;
                if (post.IdPost == 3)
                    EnginerSpecialitySp.Visibility = Visibility.Visible;
                else
                    EnginerSpecialitySp.Visibility = Visibility.Collapsed;
            }
        }
    }
}
