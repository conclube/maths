"""Visual evidence must never survive changed PDFs or missing reviewed pages."""
import unittest
from copy import deepcopy
from delivery_audit import validate_evidence

class EvidenceTests(unittest.TestCase):
    def setUp(self):
        self.integrity=dict(sha256='pdf',pages=3,overflow=[],sparse_pages=[3])
        self.render=dict(sha256='pdf',pages=3,contacts=['sheet'],contact_sha256={'sheet':'image'})
        self.review=dict(sha256='pdf',pages=3,contacts=['sheet'],contact_sha256={'sheet':'image'},sparse_pages_reviewed=[3])

    def test_matching_evidence(self):
        validate_evidence('test.pdf','pdf',3,self.integrity,self.render,self.review)

    def test_changed_pdf_rejects_approval(self):
        with self.assertRaisesRegex(AssertionError,'stale evidence'):
            validate_evidence('test.pdf','new-pdf',3,self.integrity,self.render,self.review)

    def test_missing_or_changed_reviewed_sheet(self):
        for change in ({'contacts':[]},{'contact_sha256':{'sheet':'other-image'}},{'sparse_pages_reviewed':[]}):
            review=deepcopy(self.review);review.update(change)
            with self.assertRaises(AssertionError):
                validate_evidence('test.pdf','pdf',3,self.integrity,self.render,review)

if __name__=='__main__':unittest.main()
