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
    public partial class AddEditCafedraPage : Page
    {
        private Cafedra cafedra;
        public AddEditCafedraPage(Cafedra _cafedra)
        {
            InitializeComponent();
            cafedra = _cafedra;
            App.CafedraPage = this;
            ShifrTb.DataContext = cafedra;
            NameCafedraTb.DataContext = cafedra;
            AbriviationTb.DataContext = cafedra;
            NameFacultetCb.DataContext = cafedra;
            NameFacultetCb.ItemsSource = App.db.Facultet.ToList();
            NameFacultetCb.SelectedItem = cafedra.Facultet;
            if (cafedra.Shifr != null)
            {
                SaveBtn.Visibility = Visibility.Collapsed;
                ShifrTb.IsEnabled = false;
                NameCafedraTb.IsEnabled = false;
                NameFacultetCb.IsEnabled = false;
                DisciplineSp.Visibility = Visibility.Visible;
            }
            else
            {
                SaveBtn.Visibility = Visibility.Visible;
                ShifrTb.IsEnabled = true;
                NameCafedraTb.IsEnabled = true;
                NameFacultetCb.IsEnabled = true;
                DisciplineSp.Visibility = Visibility.Collapsed;
            }
                
            CafedraDisciplineList.ItemsSource = App.db.Discipline.Where(x => x.Shifr == cafedra.Shifr).ToList();

        }

        

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            if (NameCafedraTb.Text != "" && NameCafedraTb.Text != null && ShifrTb.Text != "")
            {
                if (AbriviationTb.Text != "" && AbriviationTb.Text != null)
                {
                    if (!App.db.Cafedra.Any(x => x.Shifr == ShifrTb.Text.ToLower()))
                    {
                        cafedra.Shifr = ShifrTb.Text.ToLower();
                        cafedra.NameCafedra = NameCafedraTb.Text;
                        cafedra.Abriviation = AbriviationTb.Text;
                        App.db.Cafedra.Add(cafedra);
                        App.db.SaveChanges();
                        Navigation.NextPage(new PageComponent(new CafedraList(), "Кафедры"));
                    }
                    else
                        MessageBox.Show("Факультет с таким шифром уже есть!");
                }
                else
                    MessageBox.Show("Выберите факультет!");
            }
            else
                MessageBox.Show("Вы не ввели название кафедры или шифр!");
        }

        private void NameFacultetCb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Facultet facultet = NameFacultetCb.SelectedItem as Facultet;
            AbriviationTb.Text = facultet.Abriviation;
        }

        private void AddDisciplineBtn_Click(object sender, RoutedEventArgs e)
        {
           new AddDisciplineCafedra(cafedra).ShowDialog();
        }

        private void DeleteDisciplineBtn_Click(object sender, RoutedEventArgs e)
        {
            Discipline discipline = CafedraDisciplineList.SelectedItem as Discipline;
            if (discipline != null)
            {
                App.db.Discipline.Where(x => x.Kod == discipline.Kod).FirstOrDefault().Shifr = null;
                App.db.SaveChanges();
                CafedraDisciplineList.ItemsSource = App.db.Discipline.Where(x => x.Shifr == cafedra.Shifr).ToList();
            }
            else
                MessageBox.Show("Вы не выбрали дисциплину!");
        }
    }
}
