using PracticLatypov.Components;
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

namespace PracticLatypov.Pages
{

    public partial class EmployeeList : Page
    {
        public EmployeeList()
        {
            InitializeComponent();
            MyList.ItemsSource = App.db.Employee.ToList();
        }

        private void DeleteEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            Employee employee = MyList.SelectedItem as Employee;
            if (employee != null)
            {
                App.db.Employee.Remove(employee);
                App.db.SaveChanges();
                MyList.ItemsSource = App.db.Employee.ToList();
            }
            else
                MessageBox.Show("Вы не выбрали сотрудника");
        }

        private void AddEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent(new AddEditEmployeePage(new Employee()), "Редактирование"));
        }

        private void EditEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            Employee employee = MyList.SelectedItem as Employee;
            if (employee != null)
                Navigation.NextPage(new PageComponent(new AddEditEmployeePage(employee), "Редактирование"));
            else
                MessageBox.Show("Вы не выбрали сотрудника!");
        }

        private void refresh()
        {
            IEnumerable<Employee> SortList = App.db.Employee;
            var Item = SortCb.SelectedItem;
            if (Item != null)
            {
                if (SortCb.SelectedIndex == 0)
                {
                    SortList = SortList.OrderBy(x => x.TabNumber);
                }
                else if (SortCb.SelectedIndex == 1)
                {
                    SortList = SortList.OrderBy(x => x.FullName);
                }
                else
                {
                    SortList = SortList.OrderBy(x => x.Oklad);
                }
            }

            if (SearchTb.Text != null)
            {
                SortList = SortList.Where(x => x.TabNumber.ToString().Contains
                (SearchTb.Text.ToLower()) || x.FullName.ToLower().Contains(SearchTb.Text.ToLower()));
            }
            MyList.ItemsSource = SortList.ToList();

        }

        private void SortCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            refresh();
        }

        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            refresh();
        }
    }
}
