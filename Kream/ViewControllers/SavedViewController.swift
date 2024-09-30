//
//  SavedViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class SavedViewController: UIViewController {

    let data = dummySavedModel.savedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.savedTableView.dataSource = self
        view.savedTableView.delegate = self
        // view.savedTableView.prefetchDataSource = self
        
        return view
    }()
}

// UITableViewDataSource: tableView에 표시될 데이터의 양과 종류를 결정 (데이터를 셀에 할당)
// UITableViewDelegate: 셀의 높이, 헤더와 푸터의 렌더링, 셀의 선택 (사용자 interaction 관리)
extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    // 데이터 프리패칭 메소드: 화면에 보이기 전에 데이터를 미리 로드할 수 있어 스크롤 시 지연을 줄일 수 있음
//    func tableView(_ tableView: UITableView, prefetchRowAt indexPaths: [IndexPath]) {
//        for indexPath in indexPaths {
//            preloadDataForItem(at: indexPath.row)
//        }
//    }
    
}

