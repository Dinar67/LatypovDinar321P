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
    /// Логика взаимодействия для ExamList.xaml
    /// </summary>
    public partial class ExamList : Page
    {
        public ExamList()
        {
            InitializeComponent();
            MyList.ItemsSource = App.db.Exam.ToList();
        }

        private void RecordStudentBtn_Click(object sender, RoutedEventArgs e)
        {
            Exam exam = MyList.SelectedItem as Exam; //объяление экз
            if(exam != null)
                Navigation.NextPage(new PageComponent(new AddEditExamPage(exam), "Редактирование")); 
        }

        private void refresh()
        {
            IEnumerable<Exam> SortList = App.db.Exam;
            var Item = SortCb.SelectedItem;
            if (Item != null)
            {
                if (SortCb.SelectedIndex == 0)
                {
                    SortList = SortList.OrderBy(x => x.IdExam);
                }
                else if (SortCb.SelectedIndex == 1)
                {
                    SortList = SortList.OrderBy(x => x.DateEXam);
                }
                else
                {
                    SortList = SortList.OrderBy(x => x.Discipline.NameDiscipline);
                }
            }

            if (SearchTb.Text != null)
            {
                SortList = SortList.Where(x => x.IdExam.ToString().Contains
                (SearchTb.Text.ToLower()) || x.Discipline.NameDiscipline.ToLower().Contains(SearchTb.Text.ToLower()));
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
