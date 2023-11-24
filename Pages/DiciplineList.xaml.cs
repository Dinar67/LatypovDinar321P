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
    /// <summary>
    /// Логика взаимодействия для DiciplineList.xaml
    /// </summary>
    public partial class DiciplineList : Page
    {
        public DiciplineList()
        {
            InitializeComponent();
            MyList.ItemsSource = App.db.Discipline.ToList();
        }

        private void refresh()
        {
            IEnumerable<Discipline> SortList = App.db.Discipline;
            var Item = SortCb.SelectedItem;
            if (Item != null)
            {
                if (SortCb.SelectedIndex == 0)
                {
                    SortList = SortList.OrderBy(x => x.Kod);
                }
                else if (SortCb.SelectedIndex == 1)
                {
                    SortList = SortList.OrderBy(x => x.NameDiscipline);
                }
                else
                {
                    SortList = SortList.OrderBy(x => x.Volume);
                }
            }

            if (SearchTb.Text != null)
            {
                SortList = SortList.Where(x => x.Kod.ToString().Contains
                (SearchTb.Text.ToLower()) || x.NameDiscipline.ToLower().Contains(SearchTb.Text.ToLower()));
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
