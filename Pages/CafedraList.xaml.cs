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

    public partial class CafedraList : Page
    {
        public CafedraList()
        {
            InitializeComponent();
            MyList.ItemsSource = App.db.Cafedra.ToList();
        }

        private void AddCafedraBtn_Click(object sender, RoutedEventArgs e)
        {
            Navigation.NextPage(new PageComponent(new AddEditCafedraPage(new Cafedra()), "Редактирование"));
        }

        private void DeleteCafedraBtn_Click(object sender, RoutedEventArgs e)
        {
            Cafedra cafedra = MyList.SelectedItem as Cafedra;
            if (cafedra != null)
            {
                App.db.Cafedra.Remove(cafedra);
                App.db.SaveChanges();
                MyList.ItemsSource = App.db.Cafedra.ToList();
            }
            else
                MessageBox.Show("Вы не выбрали кафедру!");
            
        }

        private void AddDisciplineCafedraBtn_Click(object sender, RoutedEventArgs e)
        {
            Cafedra cafedra = MyList.SelectedItem as Cafedra;
            if(cafedra != null)
                Navigation.NextPage(new PageComponent(new AddEditCafedraPage(cafedra), "Редактирование"));
        }

        private void refresh()
        {
            IEnumerable<Cafedra> SortList = App.db.Cafedra;
            var Item = SortCb.SelectedItem;
            if (Item != null)
            {
                if (SortCb.SelectedIndex == 0)
                {
                    SortList = SortList.OrderBy(x => x.Shifr);
                }
                else if (SortCb.SelectedIndex == 1)
                {
                    SortList = SortList.OrderBy(x => x.NameCafedra);
                }
                else
                {
                    SortList = SortList.OrderBy(x => x.Facultet.NameFacultet);
                }
            }

            if (SearchTb.Text != null)
            {
                SortList = SortList.Where(x => x.Shifr.ToLower().Contains
                (SearchTb.Text.ToLower()) || x.NameCafedra.ToLower().Contains(SearchTb.Text.ToLower()) 
                || x.Facultet.NameFacultet.ToLower().Contains(SearchTb.Text.ToLower()));
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
