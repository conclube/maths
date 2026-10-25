"""Regression checks for the multiline source format and curriculum contracts."""
import unittest
from source_audit import fields, calls, inventory, ROOT

class SourceTests(unittest.TestCase):
    def test_nested_multiline_and_named_fields(self):
        text = '''p(13, "A", "A comma, and colon: in a string",
          [A [nested] question with $f(x,y)$ and "quoted, text".],
          [one], [two], [A paragraph.\n\nA second paragraph.], [criteria],
          optional: true, minutes: 60, idea: [An independent idea.],
        )'''
        row,length=fields(text)
        self.assertEqual(length,len(text))
        self.assertEqual(len(row),11)
        self.assertIn('nested',row[3])
        self.assertEqual(row[-2],'minutes: 60')
        self.assertEqual(list(calls('\n  '+text+'\n'))[0][2],row)

    def test_malformed_record_fails(self):
        with self.assertRaises((AssertionError,ValueError)):
            fields('p(1,"E","objective",[unclosed, [hint])')

    def test_current_inventory(self):
        rows=inventory()
        self.assertEqual(len(rows),464)
        self.assertEqual(sum(r['optional'] for r in rows),32)
        self.assertEqual(sum(r['idea'] is not None for r in rows),64)
        for r in rows:
            if r['idea']:
                self.assertNotEqual(r['idea'],r['hint2'])
                self.assertGreater(len(r['solution'].split()),100)

    def test_targeted_teaching_routes(self):
        targets={'MM5020':[3,4,6,7,8],'MM7030':[3,5,6,7],
                 'MM7033':[2,4,5,6,8],'MM8036':[2,3,4,5,6]}
        for code,units in targets.items():
            course=next(ROOT.glob(code+' - *'))
            for unit in units:
                text=(course/'1. Lectures'/f'u{unit:02}.typ').read_text(encoding='utf-8')
                self.assertIn('*Bridge into this unit.*',text)
                route=text.split('=== A slower route through the central ideas',1)[1]
                self.assertGreaterEqual(route.count('#example['),2)
                self.assertIn('*A failed shortcut.*',route)
                self.assertGreater(len(route.split()),250)

if __name__=='__main__':unittest.main()
